//
//  BookMarkButton.swift
//  rest
//
//  Created by kalsky_953982 on 2/22/25.
//

import SwiftUI

struct BookMarkButton: View {
    @Binding var loadingBook: Bool
    var time: Int
    var id: Int
    var body: some View {
        
        Button{
            withAnimation(.easeInOut){
                loadingBook = true
                
                if var books = UserDefaults.standard.array(forKey: "Bookmarks") as? [Int], books.contains(id) {
                    let index = books.firstIndex(of: id)
                    books.remove(at: index!)
                    UserDefaults.standard.set(books, forKey: "Bookmarks")
                    
                }else{
                    if var bookmarkIds = UserDefaults.standard.array(forKey: "Bookmarks") as? [Int]{
                        bookmarkIds.append(id)
                        UserDefaults.standard.set(bookmarkIds, forKey: "Bookmarks")
                    }else{
                        UserDefaults.standard.set([id], forKey: "Bookmarks")
                    }
                }
                loadingBook = false
            }
        }label:{
            if loadingBook{
                    if time % 2 == 0{
                        Image(systemName: "circle.dashed")
                    }else{
                        Image(systemName: "circle.dotted")
                    }
            }else{
                if let bookmarkIds = UserDefaults.standard.array(forKey: "Bookmarks") as? [Int], bookmarkIds.contains(id) {
                    Image(systemName: "bookmark.fill").resizable().scaledToFit().frame(width: 20, height: 20)
                }else{
                    Image(systemName: "bookmark").resizable().scaledToFit().frame(width: 20, height: 20)
                }
            }
            
        }
    }
}


