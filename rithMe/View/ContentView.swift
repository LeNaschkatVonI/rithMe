//
//  ContentView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var library = LibraryStorage()
    @State private var addNewBook: Bool = false
    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    addNewBook.toggle()
                }, label: {
                    HStack() {
                        Spacer()
                        Image(systemName: "book.circle")
                        Text("ADD")
                        Spacer()
                    }
                    .font(Settings.BookFonts.Title)
                }).buttonStyle(BorderlessButtonStyle())
                ForEach(library.sortedBooks) { item in
                    BookRow(book: item, image: $library.uiImages[item])
            }
            }.navigationBarTitle("iBooks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewedAllColorSchemes
    }
}

