//
//  Demo.swift
//  rest
//
//  Created by kalsky_953982 on 2/17/25.
//

import SwiftUI

enum demoSlides{
    case slide1, slide2, slide3, slide4, slide5, slide6
}

struct Demo: View {
    
    @State private var slide: demoSlides = .slide1
    @Binding var show: Bool
    
    var body: some View {
        Rectangle()
            .fill(.white)
            .opacity(0.05)
            .background(.ultraThinMaterial)
            .frame(width: 350, height: 550, alignment: .center)
            .cornerRadius(15)
            .overlay(alignment: .center) {
                ZStack(alignment: .center){
            
                    VStack{
                        
                        switch slide{
                        case .slide1:
                            Slide1(slide: $slide)
                        case .slide2:
                            Slide2(slide: $slide)
                        case .slide3:
                            Slide3(slide: $slide)
                        case .slide4:
                            Slide4(slide: $slide)
                        case .slide5:
                            Slide5(slide: $slide)
                        case .slide6:
                            Slide6(slide: $slide, show: $show)
                        }
                        
                    }
                    VStack{
                        HStack(alignment: .top) {
                            NavigationLink(destination: Intro().accentColor(Color(UIColor(resource: .CS_6)))) {
                                Image(systemName: "questionmark.circle")
                            }.padding()
                            
                            Spacer()
                            
                            Button{
                                withAnimation(.easeOut(duration: 0.5)){
                                    show = false
                                }
                            } label: {
                                Image(systemName: "xmark")
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                    
                }
            }
            
            
    }
}

#Preview {
    Demo(show: .constant(true))
}
