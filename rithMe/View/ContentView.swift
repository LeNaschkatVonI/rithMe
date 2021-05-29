//
//  ContentView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    var library = LibraryStorage()
    @State private var addNewBook: Bool = false
    var body: some View {
        NavigationView {
            List(0..<library.sortedBooks.count) { item in
                BookRow(book: library.sortedBooks[item])
            }.navigationBarTitle("iBooks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

