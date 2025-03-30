//
//  WrongSheet.swift
//  rest
//
//  Created by kalsky_953982 on 2/18/25.
//

import SwiftUI

struct WrongSheet: View {
    @Binding var answeredWrong: Bool
    @Binding var showHelp: Bool
//    @Binding var next: Bool
    var work: Int
    var answer: Int
    var time: Int
    
    var body: some View {
        VStack{
            ZStack{
                
                Text("Not Quite")
                    .bold().padding()
                
                HStack{
                    Button{
                        withAnimation{
                            answeredWrong = false
                            showHelp = true
                        }
                    } label: {
                        HStack{
                            Text("Help")
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    Spacer()
                    Button{
                        answeredWrong = false
                    }label: {
                        Image(systemName: "xmark")
                    }
                }.padding()
            }.padding()
            VStack{
                HStack{
                    Text("Answer: \(answer)").padding()
                    Spacer()
                    Text(Duration.seconds(time).formatted(.time(pattern: .minuteSecond))).padding()
                    Image(systemName: "alarm.waves.left.and.right.fill").padding()
                }
                HStack{
                    Text("Your Answer: \(work)").padding()
                    Spacer()
                }
            }
            Button{
                answeredWrong = false
            } label:{
                Text("Close")
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(Color(UIColor(resource: .wrongRed)))
                    .cornerRadius(15)
                    .foregroundStyle(.white)
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    WrongSheet(answeredWrong: .constant(true), showHelp: .constant(false), work: 1234, answer: 12345, time: 67)
}
