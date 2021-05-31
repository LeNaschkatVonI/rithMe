//
//  BookRow.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    @Binding var image: UIImage?
    var body: some View {
        NavigationLink (
            destination: DetailView(book: book, image: $image)) {
            BookLink(book: book, image: $image)
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book(), image: .constant(nil))
    }
}

struct BookLink: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    var body: some View {
        HStack(spacing: 0) {
            Book.Image(title: book.title, size: 80, uiImage: image)
            VStack(alignment: .leading) {
                Text(book.title.capitalized)
                    .font(Settings.BookFonts.Title)
                Text(book.author.capitalized)
                    .font(Settings.BookFonts.Author)
                    .foregroundColor(.secondary)
                if !book.microReview.isEmpty {
                    Spacer()
                }
                Text(book.microReview)
                    .font(Settings.BookFonts.Description)
                    .foregroundColor(.secondary)
                
            }.padding()
            Spacer()
            BookmarkButton(book: book)
                .buttonStyle(BorderlessButtonStyle())
        }
    }
}
