//
//  NumberSense.swift
//  rest
//
//  Created by kalsky_953982 on 2/12/25.
//


import SwiftUI

struct NumberSense: View {
    
    @State private var problem = ""
    @State private var work: String = ""
    @State private var answer = 0
    @State private var positive = true
    @State private var help = UIImage()
    @State private var showHelp = false
    @State private var showInfo = false
    @State private var questionID = -1
    @State private var questionNum = -1
    @State private var correctCount = 0
    @State private var time = 0
    @State private var finalTime = 0
    @State private var answeredRight = false
    @State private var answeredWrong = false
    @State private var loadingBook = false
    @State private var next = false
    @State private var currentLine: Line?
    @State private var lines: [Line] = []
    @State private var lastPrediction: ((Int64, Double), (Int64, Double)) = ((0,0), (0,0))
    let stopwatch = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @AppStorage("Sampling") var collectData: Bool = true
    @AppStorage("demoCompleted") var demoCompleted = false
    private let questionFuncs = [IntegerSimplification, RemainderQuestion, RomanNumerals, TwoXtwo, OneHundreds, Squares, Cubes, DifferenceOfSquaresEndingIn5, AboveAndUnder50Squared, LCM, GCD, TriangularNumbers, TwoByTwoMultiplication, ImproperFractionMultiplication, IntegerSequenceSum, RootApproximation]
    var body: some View{
        NavigationStack{
            ZStack(alignment: .center){
                
                Color(UIColor(resource: .CS_1))
                    .ignoresSafeArea()
                
                VStack{
                    
//                    Spacer(minLength: 100)
                    
                    HStack(alignment: .center){
                        //HEADER
                        Button{
                            questionNum = 1
                            correctCount = 0
                            generateAllLessonImages()
                        } label: {
                            Image(systemName: "slider.horizontal.2.rectangle.and.arrow.triangle.2.circlepath")
                        }.disabled(showInfo).padding()
                        
                        Text(String(format: "Accuracy %d%%", (100*correctCount)/max(1,questionNum, correctCount)))
                            .font(.title2)
                            
                        
                        
                        Spacer()
                        
                        
                        NavigationLink(destination: Bookmarks()) {
                            Image(systemName: "book.closed.fill")
                        }
                        .padding()
                        
                        Button{
                            showInfo = true
                        } label: {
                            Image(systemName: "info.circle")
                        }.disabled(showInfo).padding()
                        
                        
                        
                    }.padding()
                    
                    
                    
                    //Answer UI
                    Text(problem)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .padding()
                    HStack{
                        
                        Button{
                            withAnimation(.easeInOut(duration: 0.1)){
                                work = String(work.reversed())
                                lastPrediction = ((0,0), (0,0))
                            }
                        }label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                        .disabled(showInfo)
                        .padding()
                        
                        Spacer()
                        
                        Text("\(positive ? "+" : "-") \(work)").padding(0)
                        Text(work.count == String(abs(answer)).count ? "" : "_").background(.yellow.opacity(time%2 == 0 ? 0.5 : 0.0)).padding(0)
                        Text("\(String(repeating: "_", count: max(0,String(abs(answer)).count-(work.count+1))))").padding(0)
                        
                        Spacer()
                        
                        Button{
                            withAnimation(.easeOut(duration: 0.1)){
                                if work.count > 0{
                                    work.removeLast()
                                }
                            }
                        }label: {
                            Image(systemName: "delete.backward.fill")
                        }
                        .disabled(showInfo)
                        .padding()
                        
                        Button{
                            withAnimation(.easeOut(duration: 0.1)){
                                if work != "" && lastPrediction.0.1 != 0.0{
                                    work.removeLast()
                                    work += "\(lastPrediction.1.0)"
                                }
                            }
                        }label: {
                            Image(systemName: "repeat.1")
                        }
                        .disabled(showInfo)
                        .padding()
                    }
                    .frame(minWidth: 300, maxWidth: 300)
                    
                    
                    //CANVAS
                    ZStack{
                        if !showHelp{
                            RoundedRectangle(cornerRadius: 15)
//                              .stroke(.black, lineWidth: 3) //17 or later
                                .stroke(lineWidth: 3)
                                .fill(Color(UIColor(resource: .CS_1)))
                                .foregroundStyle(.black)
                                .frame(width: 300, height: 300)
                                .shadow(radius: 3)
                        }
                    if !showHelp{
                        Canvas{ context, size in
                            
                            //live drawing
                            if let currentLine = currentLine{
                                drawLine(context: context, line: currentLine, color: .blue)
                            }
                            //other strokes
                            for line in lines {
                                drawLine(context: context, line: line, color: Color(UIColor(resource: .CS_6)))
                            }
                        }
                        .shadow(radius: 1.5)
                        .frame(width: 300, height: 300)
                        .foregroundStyle(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
//                             .stroke(Color(UIColor(resource: .CS_6)) , lineWidth: 3) // 17 or later
                                .stroke(lineWidth: 3)
                                .foregroundStyle(Color(UIColor(resource: .CS_6)))
                                .shadow(color: Color(UIColor(resource: .CS_6)) ,radius: 1.5)
                        )
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 5)
                                .onChanged{ value in
                                    
                                    //drawing
                                    if currentLine == nil || currentLine!.points.isEmpty{
                                        currentLine = Line(points: [value.location])
                                    }
                                    currentLine?.points.append(value.location)
                                    
                                }
                                .onEnded{ value in
                                    //finished drawing
                                    lines.append(currentLine ?? Line(points: []))
                                    currentLine = nil
                                }//drag if not then 2 tap
                                .exclusively(before:
                                                TapGesture(count: 2)
                                    .onEnded({ _ in
                                        withAnimation{
                                            if !lines.isEmpty {
                                                lines.removeLast()
                                            }
                                        }
                                    })
                                             //2 tap if not then 1 tap
                                    .exclusively(before: TapGesture(count: 1)
                                        .onEnded({ _ in
                                            
                                            Task{
                                                
                                                var points: [CGPoint] = []
                                                for line in lines{
                                                    points += line.points
                                                }
                                                if !points.isEmpty{
                                                    let predictions = await getNumber(line: Line(points: points), canvasSize: 300, sample: false)
                                                    withAnimation{
                                                        if work.count < "\(abs(answer))".count {
                                                            work += "\(predictions.0.0)"
                                                        }
                                                        lastPrediction = predictions
                                                        
                                                        lines = []
                                                    }
                                                }
                                            }
                                        }
                                                )//onEnded 1 tap
                                                 
                                    ) //1 tap
                                            )// 2 or 1
                            
                        )//gesture
                        //Long Press reset board
                        .simultaneousGesture(
                            LongPressGesture()
                                .onEnded({ _ in
                                    withAnimation{
                                        lines.removeAll()
                                    }
                                })
                        )
                        .padding()
                    }else{
                        //HELP IMAGE
                        
                        VStack{
                            Image(uiImage: help)
                                .resizable()
                                .cornerRadius(30)
                                .shadow(radius: 7)
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                            
                            HStack{
                                Button{
                                    withAnimation{
                                        showHelp = false
                                        next = true
                                    }
                                }label: {
                                    Text("Close")
                                }
                                .disabled(showInfo)
                                Spacer()
                                BookMarkButton(loadingBook: $loadingBook, time: time, id: questionID)
                            }.padding()
                        }
                        
                    }
                }
                    //bottom bar UI
                    if !showHelp {
                        VStack{
                            //Copy / Reuse last digit | left
                            //Erase Options | right
                            HStack{
                                Button{
                                    withAnimation{
                                        if work.count > 0 && work.count < String(answer).count{
                                            work += String(work.last!)
                                        }
                                    }
                                }label: {
                                    Image(systemName: "doc.on.doc.fill")
                                }
                                .disabled(showInfo)
                                .padding()
                                
                                Button{
                                    withAnimation{
                                        positive.toggle()
                                    }
                                }label: {
                                    Image(systemName: "plusminus.circle.fill")
                                }
                                .disabled(showInfo)
                                .padding()
                                
                                
                                
                                Spacer()
                                
                                Button{
                                    withAnimation{
                                        if !lines.isEmpty{
                                            lines.removeLast()
                                        }
                                    }
                                }label: {
                                    Image(systemName: "arrow.uturn.backward.circle")
                                }
                                .disabled(showInfo)
                                .padding()
                                
                                Button{
                                    withAnimation{
                                        lines.removeAll()
                                    }
                                }label: {
                                    Image(systemName: "rectangle.badge.minus")
                                        .foregroundStyle(.red)
                                }
                                .disabled(showInfo)
                                .padding()
                            }.frame(width: 300)
                            
                            
                        }
                        
                        
                        //GO
                        
                        Button{
                            withAnimation{
                                if answer == ((positive ? 1 : -1) * (Int(work) ?? 0)){
                                    answeredRight = true
                                    correctCount += 1
                                }else{
                                    answeredWrong = true
                                }
                            }
                        }label: {
                            Text("Check")
                                .frame(width: 300, height: 50)
                                .background(Color(UIColor(resource: .CS_6)))
                                .cornerRadius(15)
                                .foregroundStyle(Color(UIColor(resource: .CS_2)))
                                .padding()
                        }
                        .disabled(showInfo)
                    }
                    Spacer()
                    
                    
                    
                    
                }
                
                if showInfo{
                    Demo(show: $showInfo)
                        .onDisappear{
                            demoCompleted = true
                        }
                }
                
            }
            .accentColor(Color(UIColor(resource: .CS_6)))
        }
        .accentColor(.blue)
        
        .onAppear{
            next = true
            if !demoCompleted{
                showInfo = true
            }
        }
        .overlay(
            Color.black.ignoresSafeArea().opacity((answeredRight || answeredWrong) ? 0.3 : 0.0)
        )
        .blur(radius: (answeredRight || answeredWrong) ? 5 : 0)
        .navigationSplitViewStyle(.balanced)
        .onReceive(stopwatch) { _ in
            withAnimation(.easeInOut){
                time+=1
            }
            
        }
        .onChange(of: answeredWrong) { _ in
            finalTime = time
            time = 0
        }
        .onChange(of: answeredRight) { _ in
            finalTime = time
            time = 0
        }
        .onChange(of: next) {new in
            if new{
                work = ""
                let p = questionFuncs[Int.random(in: 0...questionFuncs.count-1)]()
                withAnimation{
                    problem = p.0
                    answer = p.1
                    help = p.2
                    questionID = p.3
                    questionNum += 1
                    showHelp = false
                    lines.removeAll()
                }
            }
            next = false
        }
        .sheet(isPresented: $answeredRight) {
            CorrectSheet(answeredRight: $answeredRight, answer: answer, time: finalTime)
                .accentColor(Color(UIColor(resource: .CS_6)))
                .presentationDetents([.fraction(0.35)])
                .onDisappear {
                    next = true
                    answeredRight = false
                }
        }
        .sheet(isPresented: $answeredWrong) {
            WrongSheet(answeredWrong: $answeredWrong, showHelp: $showHelp, work: ((positive ? 1 : -1) * (Int(work) ?? 0)), answer: answer, time: finalTime)
                .presentationDetents([.fraction(0.35)])
                .accentColor(Color(UIColor(resource: .CS_6)))
                .onDisappear {
                    if !showHelp{
                        next = true
                    }
                    answeredWrong = false
                }
        }
        
        
        
        
        
    }
    
}

#Preview {
    NumberSense()
}
