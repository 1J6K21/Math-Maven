//
//  CorrectSheet.swift
//  rest
//
//  Created by kalsky_953982 on 2/18/25.
//

import SwiftUI

struct CorrectSheet: View {
    @Binding var answeredRight: Bool
//    @Binding var next: Bool
    var answer: Int
    let time: Int
    
    var body: some View {
        VStack{
            ZStack{
                Text("Corrrect!")
                    .bold().padding()
                
                HStack{
                    Spacer()
                    Button{
                        answeredRight = false
                    }label: {
                        Image(systemName: "xmark")
                    }.padding()
                }
            }.padding()
            HStack{
                Text("Answer: \(answer)").padding()
                Spacer()
                Text(Duration.seconds(time).formatted(.time(pattern: .minuteSecond))).padding()
                Image(systemName: "alarm.waves.left.and.right.fill").padding()
            }.padding()
            Button{
                answeredRight = false
            } label:{
                Text("Close")
                    .frame(width: 350, height: 40, alignment: .center)
                    .background(Color(UIColor(resource: .correctGreen)))
                    .cornerRadius(15)
                    .foregroundStyle(.white)
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    CorrectSheet(answeredRight: .constant(true), answer: 12345, time: 67)
}
