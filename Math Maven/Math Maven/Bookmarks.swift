//
//  Bookmarks.swift
//  rest
//
//  Created by kalsky_953982 on 2/22/25.
//

import SwiftUI

struct Bookmarks: View {
    @State private var bookmarkIds: [Int] = []
    @State private var nonSavedIds: [Int] = []
    @State private var loadingBook = false
    @State private var displayLesson = false
    @State private var selectedLesson = UIImage()
    @State private var selectedLessonTitle = ""
    var body: some View {
        ZStack{
            List{
                Text("Hold to explore strategy").font(.largeTitle).bold().padding().frame(alignment: .leading)
                
                Section(header:
                            HStack{
                    Image(systemName: "bookmark.fill")
                    Text("Saved Strategies")
                }
                ) {
                    ForEach(bookmarkIds, id: \.self) { id in
                        HStack{
                            Text(getStrategy(id: id).0).padding()
                            Spacer()
                            Image(uiImage: getStrategy(id: id).1).resizable().scaledToFit().frame(height: 50).cornerRadius(5).shadow(radius: 0.5).padding()
                            
                            BookMarkButton(loadingBook: $loadingBook, time: 1, id: id)
                        }
                        .simultaneousGesture(
                            
                            LongPressGesture(minimumDuration: 0.5)
                                .onEnded({ _ in
                                    withAnimation{
                                        displayLesson = true
                                        let strat = getStrategy(id: id)
                                        selectedLessonTitle = strat.0
                                        selectedLesson = strat.1
                                    }
                                })
                            
                        )
                    }
                }
                
                Section(header:
                            HStack{
                    Image(systemName: "book.closed.fill")
                    Text("Other Strategies")
                }
                ) {
                    
                    ForEach(nonSavedIds, id: \.self) { id in
                        HStack{
                            Text(getStrategy(id: id).0).padding()
                            Spacer()
                            Image(uiImage: getStrategy(id: id).1).resizable().scaledToFit().frame(height: 50).cornerRadius(5).shadow(radius: 0.5).padding()
                            BookMarkButton(loadingBook: $loadingBook, time: 1, id: id)
                            
                        }
                        .simultaneousGesture(
                            
                            LongPressGesture(minimumDuration: 0.5)
                                .onEnded({ _ in
                                    withAnimation{
                                        displayLesson = true
                                        let strat = getStrategy(id: id)
                                        selectedLessonTitle = strat.0
                                        selectedLesson = strat.1
                                    }
                                })
                            
                        )
                    }
                }
                
            }
            .listStyle(.sidebar)
            .navigationTitle("Bookmarks")

            
            if displayLesson {
                Rectangle()
                    .fill(.white)
                    .opacity(0.05)
                    .background(.ultraThinMaterial)
                    .frame(width: 350, height: 450, alignment: .center)
                    .cornerRadius(15)
                    .overlay(alignment: .center) {
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Button{
                                    withAnimation{
                                        displayLesson = false
                                    }
                                }label: {
                                    Image(systemName: "xmark")
                                }.padding()
                                
                            }.padding()
                            
                            Spacer()
                            
                            Text(selectedLessonTitle).bold().padding()
                            Image(uiImage: selectedLesson).resizable().scaledToFit().shadow(radius: 1).cornerRadius(5).frame(width: 300, height: 300, alignment: .center).padding()
                        }
                    }
            }
        }
        .accentColor(Color(UIColor(resource: .CS_6)))
        .onAppear{
            if let books = UserDefaults.standard.array(forKey: "Bookmarks") as? [Int]{
                bookmarkIds = books
                nonSavedIds = Array(1...11).filter{ !books.contains($0) }
            }else{
                bookmarkIds = []
                nonSavedIds = Array(1...11)
            }
        }
        .onChange(of: UserDefaults.standard.array(forKey: "Bookmarks") as? [Int] ?? []) { newValue in
            withAnimation{
                bookmarkIds = newValue
                nonSavedIds = Array(1...11).filter{ !bookmarkIds.contains($0) }
            }
        }
    }
    
}

#Preview {
    Bookmarks()
}

public func getStrategy(id: Int) -> (String, UIImage){
    
    switch id{
    case 1:
        return("Integer Simplification", UIImage(resource: .intSimplification))
    case 2:
        return("Remainders", UIImage(resource: .remainders))
    case 3:
        return("Roman Numeral Conversion", UIImage(resource: .romanNumerals))
    case 4:
        return("Two by Two LOIF", UIImage(resource: .twoXTwos))
    case 5:
        return("Multiply numbers near 100", UIImage(resource: .nearHundred))
    case 6:
        return("Squares", UIImage(resource: .squares))
    case 7:
        return("Cubes", UIImage(resource: .cubes))
    case 8:
        return("Difference of Squares Ending in 5", UIImage(resource: .differenceOfSquaresEndingIn5))
    case 9:
        return("Squares near 50", UIImage(resource: .squaresNear50))
    case 10:
        return("LCM", UIImage(resource: .LCM))
    case 11:
        return("GCD", UIImage(resource: .GCD))
    case 12:
        return("Triangular Numbers", UIImage(resource: .squares))
    case 13:
        return("Two by Two Multiplication", UIImage(resource: .twoXTwos))
    case 14:
        return("Improper Fraction Multiplication", UIImage(resource: .nearHundred))
    case 15:
        return("Integer Sequence Sum", UIImage(resource: .squares))
    case 16:
        return("Root Approximation", UIImage(resource: .squares))
    default:
        return("", UIImage())
    }
}
