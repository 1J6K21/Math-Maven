//
//  Intro.swift
//  rest
//
//  Created by kalsky_953982 on 2/18/25.
//

import SwiftUI

struct Intro: View {
    @AppStorage("tutorialCompleted") var tutorialCompleted = false
    @State private var slide = 1
    private let bgColors: [Color] = [.CS_1, .CS_4, .CS_2, .CS_5, .CS_3, .CS_1, .CS_4, .CS_2, .CS_5, .CS_3]
    private let textAccent: [Color] = [.CS_6, .CS_3, .CS_6, .CS_1, .CS_6, .CS_6, .CS_3, .CS_6, .CS_1, .CS_6]
    
    var body: some View {
        ZStack{
            bgColors[slide-1].ignoresSafeArea()
            
            VStack{
                switch slide {
                case 1:
                    IntroSlide1()
                case 2:
                    IntroSlide2()
                case 3:
                    Pause(tutorialCompleted: $tutorialCompleted, slide: $slide)
                case 4:
                    IntroSlide3()
                case 5:
                    IntroSlide4()
                case 6:
                    IntroSlide5()
                case 7:
                    IntroSlide6()
                case 8:
                    IntroSlide7(tutorialCompleted: $tutorialCompleted, slide: $slide)
                default:
                    VStack{Text("There was an issue loading introduction")}
                }
            }
            .foregroundStyle(textAccent[slide-1])
            .ignoresSafeArea()
                
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if slide != 8{
                    slide+=1
                }
            }

        }
        .gesture(
            DragGesture(minimumDistance: 10)
                .onEnded({ _ in
                    withAnimation {
                        if slide != 1{
                            slide-=1
                        }
                    }
                })
        )

        
        
    }
        
}

struct IntroSlide1: View{
    var body: some View{
        VStack{
            Spacer()
            
            HStack{
                Image(systemName: "iphone.sizes")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Use an iPhone for this app")
                    .multilineTextAlignment(.center)
                    .bold()
            }.padding()
            
            HStack{
                Image(systemName: "hand.tap.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Tap to move forward")
                    .multilineTextAlignment(.leading)
            }.padding()
            
            HStack{
                Image(systemName: "hand.point.up.left.and.text.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Drag to move backward")
                    .multilineTextAlignment(.leading)
            }.padding()
            
            Spacer()
            
            HStack{
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
        }.frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}

struct IntroSlide2: View{
    var body: some View{
        VStack{
            Spacer()
            Text("Background")
                .bold()
                .font(.largeTitle)
            HStack{
                Image(systemName: "trophy.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("It is my second year competing in UIL Academics, and I find one competition unique.")
                    .multilineTextAlignment(.center)
            }.padding()
            
            HStack{
                Image(systemName: "brain.head.profile.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Number Sense is a timed mental math competition, which may seem overwhelming at first. However, there is an uplifitng thrill if you learn and memorize tricks number tricks.")
                    .multilineTextAlignment(.center)
            }.padding()
            
            Spacer()
            
            HStack{
                Image(systemName: "link")
                    .resizable()
                    .scaledToFit()
                    .frame(width:25, height: 25)
                Link("UIL Academics", destination: URL(string: "https://www.uiltexas.org/academics")!)
            }.padding()
            
            HStack{
                Image(systemName: "link")
                    .resizable()
                    .scaledToFit()
                    .frame(width:25, height: 25)
                Link("Number Sense Tricks", destination: URL(string: "https://bryantheath.com/files/2018/04/Heath_NSTricks_revA.pdf")!)
            }.padding()
            Spacer()
            
            HStack{
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
        }.frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}


struct IntroSlide3: View{
    var body: some View{
        VStack{
            Spacer()
            Text("Ongoing")
                .bold()
                .font(.largeTitle)
                .padding()
            
            HStack{
                Image(systemName: "graduationcap.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Last year I published my first iOS app, while part of a team, among other projects.")
                    .multilineTextAlignment(.leading)
            }.padding()
            
            HStack{
                Image(systemName: "macpro.gen3.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("This year I was interested in studying Machine Learning.")
                    .multilineTextAlignment(.leading)
            }.padding()
            
            HStack{
                Image(systemName: "hammer.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
                Text("Combining these experiences, I developed a playground tool for this competition that is meant to provide practice in Number Sense and mental math.")
                    .multilineTextAlignment(.leading)
            }.padding()
            
            Spacer()
            
            HStack{
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
        }.frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}


struct IntroSlide4: View{
    var body: some View{
        ScrollView{
            Spacer(minLength: 200)
            Text("Machine Learning")
                .bold()
                .font(.largeTitle)
                .padding()
                .frame(alignment: .center)
            Text("Math and iOS app development are clearly implemented. But Machine Learning?")
                .font(.subheadline)
                .frame(alignment: .leading)
            
            NavigationLink(destination: ContentView()) {
                Text("View Sampling UI")
                    .frame(width: 200, height: 20, alignment: .center)
                    .padding()
                    .background(.CS_1)
                    .cornerRadius(15)
                    .foregroundStyle(.CS_5)
            }
            .frame(width: 200, height: 20, alignment: .center)
            .padding()
            
            Text("Being in High School, I had the advantage of collecting large counts of data. I cluster sampled random kids, and asked them to follow a procedure to draw all digits from 0-9 in a square.").font(.footnote)
            
            Spacer()
            
            Text("Manipulating Data").padding()
            Text("Drawn strokes contained points transformed onto a 28x28 matrix. The true value of the drawing, and the location of the points were transformed and noted in two csv files locally: one containing a centered transformation of the matrix's elements, and one unchanged. The two data files of the same length were joined with an equal-length subrange of the MNIST(hand drawn digits) to form the labled-input training and validation data.").font(.footnote)
            
            Spacer()
            
            Text("Training").padding()
            Text("I used a new equal-length subrange of the MNIST for testing, and loaded the training and validation data onto XCode's CreateML. When training was complete, I was able to import the classifier model into my project. The model's class takes input in the same format it was trained, which is why creating my training data was beneficial.").font(.footnote)
            
            Spacer()
            
            HStack{
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
        }
        .defaultScrollAnchor(.top)
        .scrollIndicators(.visible)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}

struct IntroSlide5: View{
    @State private var lines: [Line] = []
    @State private var currentLine: Line?
    @State private var Matrix: [[Int]] = []
    var body: some View{
        ScrollView{
            
            Spacer(minLength: 200)
            
            Text("Try")
                .bold()
                .font(.largeTitle)
                .padding()
                .frame(alignment: .center)
            Text("In the whiteboard square, slowly draw and submit a 3 (easy see). Look at the resulting Matrix.")
                .font(.subheadline)
                .frame(alignment: .leading)
            
            Spacer()
            VStack{
                ZStack{
                    //canvas background adjustment
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 3)
                        .fill(.CS_1)
                        .frame(width: 300, height: 300)
                        .shadow(radius: 3)
                    
                    //Whiteboard
                    Canvas{ context, size in
                        //previous lines
                        for line in lines {
                            drawLine(context: context, line: line, color: .CS_6)
                        }
                        //live drawing
                        if let currentLine = currentLine{
                            drawLine(context: context, line: currentLine, color: .blue)
                        }
                        
                    }
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.CS_6, lineWidth: 3)
                            .shadow(color: .CS_6 ,radius: 1.5)
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
                Spacer()
                
                HStack{
                   Spacer()
                    
                    Button{
                        if !lines.isEmpty{
                            var points: [CGPoint] = []
                            for line in lines{
                                points.append(contentsOf: line.points)
                            }
                            Task{
                                Matrix = await getMatrix(line: Line(points: points), canvasSize: 300)
                                lines.removeAll()
                            }
                        }
                        
                    } label: {
                        
                        Text("Submit")
                            .foregroundStyle(.white)
                            .frame(width: 200, height: 50)
                            .background(.blue)
                            .cornerRadius(30)
                        
                    }.padding()
                    
                    Button{
                        if !lines.isEmpty{
                            lines.removeLast()
                        }
                    }label: {
                        Image(systemName: "arrow.uturn.backward")
                    }.padding()
                    
                    Spacer()
                    
                }.frame(width: 300)
                
                Spacer()
                
                ScrollView(.horizontal){
                    ScrollView(.vertical) {
                        ForEach(0..<Matrix.count, id: \.self) { row in
                            Text(Matrix[row].description.replacingOccurrences(of: "255", with: "⚫").replacingOccurrences(of: "0", with: "⚪"))
                        }
                    }
                    .scrollIndicators(.visible)
                    .defaultScrollAnchor(.center)
                }
                .scrollIndicators(.visible)
                .defaultScrollAnchor(.center)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .CS_6 ,radius: 1)
                
            }
            
            Spacer()
            
            HStack{
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
            
        }
        .defaultScrollAnchor(.top)
        .scrollIndicators(.visible)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}

struct IntroSlide6: View{
    var body: some View{
        VStack{
            Spacer()
            Text("Why Math Maven?")
                .bold()
                .font(.largeTitle)
                .padding()
            
            VStack{
                Text("There is a unanimous modern goal among tech firms to improve lives of people through technology, and recently AI.\nMy submission of Math Maven revolves around the idea of empowering and entertaining people of all ages who seek to improve in the sector of quick mental math.\nGet warm, because you are about to practice complicated High School mental math. Let's see if you are aware of any of these strategies.")
                    .multilineTextAlignment(.leading).padding()
                Image(systemName: "function")
                    .resizable()
                    .scaledToFit()
                    .frame(width:40, height: 40)
            }.padding()
            
            Spacer()
            
            
            HStack{
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
                Image(systemName: "circle.fill").resizable().scaledToFit().padding()
                Image(systemName: "circle").resizable().scaledToFit().padding()
            }.frame(height: 43).padding()
            
        }.padding()
    }
}

struct IntroSlide7: View{
    @Binding var tutorialCompleted: Bool
    @Binding var slide: Int
    var body: some View{
        VStack{
            Spacer()
            Text("All Together")
                .bold()
                .font(.largeTitle)
                .padding()
            
            VStack{
                Text("This project uses XCode's tools for Swift and XCode, to combine my programming and Machine Learning skillsets.\n\nThe app playground is the root of a tool that can help Number Sense competitors, or math enthusiasts, familiarize with mental math tricks!")
                    .multilineTextAlignment(.leading).padding()
                Image(systemName: "wrench.and.screwdriver")
                    .resizable()
                    .scaledToFit()
                    .frame(width:40, height: 40)
            }.padding()
            
            Spacer()
            
            HStack{
                if !tutorialCompleted{
                    Button{
                        withAnimation{
                            tutorialCompleted = true
                        }
                    }label: {
                        Text("Begin")
                            .frame(width: 100, height: 20)
                            .padding()
                            .background(.CS_6)
                            .cornerRadius(15)
                            .foregroundStyle(.CS_3)
                    }
                }
                
                Button{
                    withAnimation{
                       slide = 1
                    }
                }label: {
                    Text("Restart Intro")
                        .frame(width: 100, height: 20)
                        .padding()
                        .background(.CS_6)
                        .cornerRadius(15)
                        .foregroundStyle(.CS_3)
                }
            }.padding()
            Spacer()
        }.padding()
    }
}

struct Pause: View {
    @Binding var tutorialCompleted: Bool
    @Binding var slide: Int
    var body: some View {
        VStack{
            
            Spacer(minLength: 200)
            
            Text("Continue Intro?").font(.title).bold().padding()
            Text("This is an interactive slideshow to learn more about the app and its creation. You can revisit it in the future through the buttons: (info) -> (question-mark). Tap to continue, or press the button to skip.").font(.footnote)
            
            Spacer()
            
            if !tutorialCompleted{
                Button{
                    withAnimation{
                        tutorialCompleted = true
                    }
                }label: {
                    Text("Begin")
                        .frame(width: 100, height: 20)
                        .padding()
                        .background(.CS_6)
                        .cornerRadius(15)
                        .foregroundStyle(.CS_3)
                }.padding()
            }else{
                Button{
                    withAnimation{
                        slide = 8
                    }
                }label: {
                    Text("Jump to End")
                        .frame(width: 100, height: 20)
                        .padding()
                        .background(.CS_6)
                        .cornerRadius(15)
                        .foregroundStyle(.CS_3)
                }.padding()
            }
            
            Spacer(minLength: 200)
            
        }.frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
    }
}

#Preview {
    Intro()
        
}
