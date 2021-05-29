//
//  BookRow.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct BookRow: View {
    let title: String
    let author: String
    var body: some View {
        let book = Book.Image(title: title.capitalized, author: author.capitalized)
        HStack(spacing: 0) {
            book
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(title: "title", author: "author")
    }
}
