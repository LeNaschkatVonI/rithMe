//
//  BookRow.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    var body: some View {
        NavigationLink (
            destination: DetailView(book: book)) {
            BookLink(book: book)
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book())
    }
}

struct BookLink: View {
    let book: Book
    var body: some View {
        HStack(spacing: 0) {
            Book.Image(title: book.title, size: 80)
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title)
                    .font(Settings.BookFonts.Title)
                Text(book.author)
                    .font(Settings.BookFonts.Author)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}
