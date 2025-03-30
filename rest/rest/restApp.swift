//
//  restApp.swift
//  rest
//
//  Created by kalsky_953982 on 1/30/25.
//

import SwiftUI

@main
struct restApp: App {
    @AppStorage("tutorialCompleted") var tutorialCompleted = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if !tutorialCompleted{
                    Intro()
                }else{
                    NumberSense()
                }
            }
        }
    }
}
