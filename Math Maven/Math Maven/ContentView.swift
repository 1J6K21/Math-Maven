//
//  ContentView.swift
//  rest
//
//  Created by kalsky_953982 on 1/30/25.
//

import SwiftUI
import CoreML



struct ContentView: View {
    
    @AppStorage("lastTestingLabel") var testingLabel = 0
    @State private var lines: [Line] = []
    @State private var currentLine: Line?
    private var canvasSize: CGFloat = 300
    @State private var selectionPicker = 0
    let options: [Int] = [0,1,2,3,4,5,6,7,8,9]
    @State private var resetFile = false
    @State private var password = false
    @State private var passwordString = ""
    private let CORRECTPASSWORD = "20072025"
    @State private var submit = false
    @State private var userConfused = false
    @State private var AddRemoveIndex = false
    @State private var mergeLast = 0
    @AppStorage("Sampling") private var sample = true
    @State private var lastPrediction: ((Int64, Double), (Int64, Double)) = ((0,0), (0,0))
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                Color(UIColor(resource: .CS_1))
                    .ignoresSafeArea()
                VStack {
                    
                    //Header
                    HStack{
//                        NavigationLink(destination: NumberSense()) {
//                            Image(systemName: "questionmark.circle")
//                        }.padding()
                        
                        Toggle("Collect Digit Samples", isOn: $sample)
                            .padding()
                        
                        Button{
                            if(!lines.isEmpty){
                                lines.removeLast()
                            }
                        }label: {
                            Image(systemName: "arrow.uturn.backward")
                        }.padding()
                        
                        Button{
                            AddRemoveIndex = true
                            
                        }label: {
                            Image(systemName: "folder.fill.badge.minus")
                        }.padding()
                    }
                    ZStack{
                        //canvas background adjustment
                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(.black, lineWidth: 3) //17 or later
                            .stroke(lineWidth: 3)
                            .fill(Color(UIColor(resource: .CS_1)))
                            .foregroundStyle(.black)
                            .frame(width: 300, height: 300)
                            .shadow(radius: 3)
                        
                        //Whiteboard
                        Canvas{ context, size in
                            //previous lines
                            for line in lines {
                                drawLine(context: context, line: line, color: Color(UIColor(resource: .CS_6)))
                            }
                            //live drawing
                            if let currentLine = currentLine{
                                drawLine(context: context, line: currentLine, color: .blue)
                            }
                            
                        }
                        .frame(width: canvasSize, height: canvasSize, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(UIColor(resource: .CS_6)), lineWidth: 3)
                                .shadow(color: Color(UIColor(resource: .CS_6)) ,radius: 1.5)
                        )
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged{ value in
                                    
                                    if currentLine == nil || currentLine!.points.isEmpty{
                                        currentLine = Line(points: [value.location])
                                    }
                                    currentLine?.points.append(value.location)
                                    
                                }
                                .onEnded{ value in
                                    if let currentLine = currentLine{
                                        lines.append(currentLine)
                                    }
                                    currentLine = nil
                                }
                            
                        )
                        .padding()
                    }
                    
                    //MERGE LINES
                    HStack{
                        
                        Button{
                            if mergeLast > 1 && lines.count >= mergeLast{
                                var newLine = Line(points: [])
                                for _ in 1 ... mergeLast{
                                    newLine.points.append(contentsOf: lines.last!.points)
                                    lines.removeLast()
                                }
                                lines.append(newLine)
                                mergeLast = 0
                                
                            }
                            
                        } label: {
                            
                            Text("Merge last \(mergeLast) strokes")
                                .foregroundStyle(.white)
                                .frame(width: 200, height: 30)
                                .background(mergeLast == 0 ? .gray : Color(UIColor(resource: .CS_6)))
                                .cornerRadius(30)
                            
                        }
                        
                        Picker("Select How Many Lines to Merge", selection: $mergeLast) {
                            ForEach(0 ... lines.count, id: \.self) {value in
                                Text("\(value)")
                            }
                        }
                        .padding(.bottom)
                    }
                    
                    Picker("Select Label for Sample", selection: $selectionPicker) {
                        ForEach(options, id: \.self) {value in
                            Text("\(value)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .padding()
                    .onChange(of: selectionPicker) { newValue in
                        testingLabel  = selectionPicker
                    }
                    
                    //Next
                    Button{
                        submit = true
                        
                    } label: {
                        Text("Submit \(selectionPicker)")
                            .foregroundStyle(.white)
                            .frame(width: 200, height: 30)
                            .background(.blue)
                            .cornerRadius(30)
                    }
                    Spacer()
                    //                Button("read file"){
                    //                    printFile(fileName: "Sampling Data")
                    //                }.foregroundStyle(.gray)
                    //                    .padding()
                    Text("First guess \(lastPrediction.0.0) | second guess \(lastPrediction.1.0)").multilineTextAlignment(.center).padding()
                    Button(role: .destructive){
                        resetFile = true
                    } label: {
                        Text("RESET FILE")
                            .bold()
                            .foregroundStyle(.red)
                    }
                    .padding()
                    
                }.confirmationDialog("Confirm RESET", isPresented: $resetFile) {
                    Button("cancel", role: .cancel){}
                    Button("CONFIRM", role: .destructive){
                        password = true
                    }
                    
                }
                .alert("Password", isPresented: $password){
                    TextField("password", text: $passwordString)
                    Button("Cancel", role: .cancel){
                        passwordString = ""
                    }
                    Button("DELETE", role: .destructive) {
                        if(CORRECTPASSWORD == passwordString){
                            writeLabelHeaderToFile(fileName: "Sampling Data")
                            printFile(fileName: "Sampling Data")
                        }
                        passwordString = ""
                    }
                    
                } message: {
                    Text("Enter Password to DELETE EVERYTHING")
                }
                .alert("Select entree", isPresented: $AddRemoveIndex){
                    
                    Button("Cancel", role: .cancel){}
                    Button("REMOVE LAST", role: .destructive) {
                        removeLast()
                    }
                    
                } message: {
                    Text("Remove the last entree?")
                }
                .confirmationDialog("Submit Digit", isPresented: $submit) {
                    Button("cancel", role: .cancel){}
                    Button("confirm"){
                        if(!lines.isEmpty){
                            print(lines[0].points)
                            let line = lines[0]
                            Task{
                                lastPrediction = await getNumber(line: line, canvasSize: Int(canvasSize), sample: sample)
                                
                                lines.removeAll()
                                mergeLast = 0
                            }
                        }
                    }
                    
                }
                
                
            }//zstack
            
            
            
            
        }//nav stack
        .accentColor(Color(UIColor(resource: .CS_6)))
    }//view
    
    
}


