//
//  DetailView.swift
//  rithMe
//
//  Created by Максим Нуждин on 29.05.2021.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        let symbolImage = SwiftUI.Image(title: book.title) ?? SwiftUI.Image(systemName: "book")
        VStack(alignment: .leading) {
            Text(book.title)
                .font(Settings.BookFonts.Title)
                .bold()
            Text(book.author)
                .font(Settings.BookFonts.Author)
                .foregroundColor(.secondary)
            symbolImage
                .resizable()
                .scaledToFit()
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
            Text(book.description?.capitalized ?? "This book still have no description")
                .font(Settings.BookFonts.Description)
            Spacer()
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
    }
}
