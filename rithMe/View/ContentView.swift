//
//  ContentView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: LibraryStorage
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
                .sheet(isPresented: $addNewBook, content: {
                    addNewBookView.init()
                })
                ForEach(Section.allCases, id: \.self) {
                    SectionView(section: $0)
                }
            }.navigationBarTitle("iBooks")
        }
    }
}

private struct SectionView: View {
    let section: Section
    var title: String {
        switch section{
        case .readMe:
            return "read me"
        case .finished:
            return "finished"
        }
    }
    @EnvironmentObject var library: LibraryStorage
    var body: some View {
        if let books = library.manuallySortedBooks[section] {
            SwiftUI.Section(header: HStack(alignment: .center) {
                Image(systemName: "book")
                Text(title)
                    .font(.system(size: 30))
            }
            .foregroundColor(.accentColor)
            ) {
                ForEach(books) {
                    BookRow(book: $0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewedAllColorSchemes
            .environmentObject(LibraryStorage())
    }
}

