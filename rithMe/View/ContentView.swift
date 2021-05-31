//
//  ContentView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var library = LibraryStorage()
    var body: some View {
        NavigationView {
            List {
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

