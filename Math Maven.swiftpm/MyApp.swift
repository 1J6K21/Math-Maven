import SwiftUI

@main
struct MyApp: App {
    @AppStorage("tutorialCompleted") var tutorialCompleted = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if !tutorialCompleted{
                    Intro().accentColor(Color(UIColor(resource: .CS_6)))
                }else{
                    NumberSense()
                }
            }.accentColor(Color(UIColor(resource: .CS_6)))
        }
    }
}
