//
//  SwiftUIView.swift
//  Math Maven
//
//  Created by kalsky_953982 on 2/23/25.
//

import SwiftUI


struct Slide1: View {
    @Binding var slide: demoSlides
    var body: some View{
        VStack{
            Spacer()
            Image(systemName: "brain.fill")
                .padding()
            Text("Math Maven is used for fast-paced, mental math practice, tested by the")
                .multilineTextAlignment(.center)
                .padding()
            
            Link("Texas UIL Number Sense Competition", destination: URL(string: "https://www.uiltexas.org/files/academics/Number_Sense_Handbook__2024-25_rev.pdf")!)
                .multilineTextAlignment(.center).foregroundStyle(.blue)
            
            Spacer()
            Text("and beyond!")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Next"){
                withAnimation(.easeOut(duration: 0.2)) {
                    //next view
                    slide = .slide2
                }
            }
            .padding()
        }.padding()
    }
}


struct Slide2: View {
    @Binding var slide: demoSlides
    var body: some View{
        VStack{
            Spacer()
            VStack{
                HStack{
                    Image(systemName: "applepencil.tip")
                    Text("Whiteboard area")
                }
                Rectangle()
                    .fill(Color(UIColor(resource: .CS_1)))
                    .border(Color(UIColor(resource: .CS_1)))
                    .shadow(color: Color(UIColor(resource: .CS_6)) ,radius: 0.5)
                    .overlay {
                        VStack{
                            Text("Use this square to draw 1 digit at a time.")
                                .foregroundStyle(Color(UIColor(resource: .CS_6)))
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                            HStack{
                                Image(systemName: "function")
                                    .foregroundStyle(Color(UIColor(resource: .CS_6)))
                                Image(systemName: "hand.draw")
                            }.padding()
                        }
                    }
                    .frame(width: 200, height: 200)
            }
            .padding()
            
            Text("Digits 0-9")
            
            Text("For the best results, write clearly and not too small.").font(.footnote)
            
            Spacer()
            
            Button("Next"){
                withAnimation(.easeOut(duration: 0.2)) {
                    //next view
                    slide = .slide3
                }
            }
            .padding()
        }
    }
}

struct Slide3: View {
    @Binding var slide: demoSlides
    var body: some View{
        VStack{
            Spacer(minLength: 80)
            
            Text("Submitting").font(.title3).bold().padding()
            
            //parse
            HStack{
                Image(systemName: "hand.tap")
                Text("Tap once to parse drawn digit into the answer blank")
            }.frame(alignment: .leading).padding(.horizontal, 10)
            
            Spacer()
            
            //undo
            HStack{
                HStack{
                    Image(systemName: "hand.tap")
                    Image(systemName: "hand.tap")
                }
                Text("Double tap to undo last drawing stroke")
            }.frame(alignment: .leading).padding(.horizontal, 10)
            HStack{
                Image(systemName: "arrow.uturn.backward.circle")
                Text("Or manually use the undo button").foregroundStyle(.gray)
            }
            .padding()
            
            Spacer()
            
            //clear
            HStack{
                Image(systemName: "hand.tap.fill")
                Text("Hold to clear the whiteboard")
            }.frame(alignment: .leading).padding(.horizontal, 10)
            HStack{
                Image(systemName: "rectangle.badge.minus")
                    .foregroundStyle(.red)
                Text("Or manually use the clear whiteboard button").foregroundStyle(.gray)
            }
            .padding()
            
            Spacer()
            
            Button("Next"){
                withAnimation(.easeOut(duration: 0.2)) {
                    //next view
                    slide = .slide4
                }
            }
            .frame(alignment: .center)
            .padding()
        }
    }
}

struct Slide4: View {
    @Binding var slide: demoSlides
    @State private var demoNumbers = [1,5,6,0]
    var body: some View{
        
        VStack{
            Spacer()
            HStack{
                Text(" _ ")
                ForEach($demoNumbers, id: \.self) { number in
                    Text("\( number.wrappedValue )")
                }
                ForEach(1...(5-demoNumbers.count), id: \.self) { number in
                    Text(" _ ")
                }
                
            }.padding()
            
            Text("Recognized digits will display in the answer blank")
                .multilineTextAlignment(.center)
                .padding()
            
            HStack{
                Button{
                    withAnimation{
                        if !demoNumbers.isEmpty{
                            demoNumbers.removeLast()
                        }
                    }
                }label: {
                    Image(systemName: "delete.left.fill")
                }
                .padding()
                Text("Delete/erase last digit")
            }
            .padding()
            
            HStack{
                
                Button{
                    withAnimation{
                        if !demoNumbers.isEmpty{
                            demoNumbers.removeLast()
                            demoNumbers.append(Int.random(in: 0...9))
                        }
                    }
                }label: {
                    Image(systemName: "repeat.1")
                }
                .padding()
                Text("Parse drawing again")
            }
            .padding()
            
            HStack{
                Button{
                    withAnimation{
                        demoNumbers.reverse()
                    }
                }label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                }
                .padding()
                Text("Reverse digit order")
            }
            .padding()
        }.padding()
        
        Spacer()
        
        Button("Next"){
            withAnimation(.easeOut(duration: 0.2)) {
                //next view
                slide = .slide5
            }
        }
        .padding()
        
    }
}

struct Slide5: View {
    @Binding var slide: demoSlides
    @State private var demoNumbers = [1,5]
    @State private var positive = true
    var body: some View{
        VStack{
            Spacer()
            
            HStack{
                Text(positive ? "+" : "-")
                Text(" _ ")
                ForEach($demoNumbers, id: \.self) { number in
                    Text("\( number.wrappedValue )")
                }
                ForEach(1...(5-demoNumbers.count), id: \.self) { number in
                    Text(" _ ")
                }
                
            }.padding()
            
            HStack{
                Button{
                    withAnimation{
                        if demoNumbers.count<4{
                            if demoNumbers.count<4{
                                demoNumbers.append(demoNumbers[demoNumbers.count-1])
                            }
                        }
                    }
                }label: {
                    Image(systemName: "doc.on.doc.fill")
                }
                .padding()
                Text("Reuse last digit")
            }
            .padding()
            
            HStack{
                Button{
                    withAnimation{
                        positive.toggle()
                    }
                }label: {
                    Image(systemName: "plusminus.circle.fill")
                }
                .padding()
                Text("Change the answer's sign")
            }
            .padding()
            
            Spacer()
            
            Button("Next"){
                withAnimation(.easeOut(duration: 0.2)) {
                    //next view
                    slide = .slide6
                }
            }
            .padding()
        }
    }
}

struct Slide6: View {
    @Binding var slide: demoSlides
    @Binding var show: Bool
    var body: some View{
        VStack{
            Spacer()
            
            HStack{
                Image(systemName: "book.closed.fill")
                .padding()
                Text("View saved strategy tips")
            }
            .padding()
            
            HStack{
                Image(systemName: "info.circle")
                .padding()
                Text("Revisit this page")
            }
            .padding()
            
            Spacer()
            Button("Finish"){
                withAnimation(.easeOut(duration: 0.2)) {
                    show = false
                }
            }
            .padding()
        }
    }
}

