//
//  BookView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

extension Book {
    struct Image: View {
        let title: String
        var size: CGFloat?
        let uiImage: UIImage?
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(Settings.MagicNumbers.CornerRadius)
            } else {
                let symbolName = SwiftUI.Image(title: title) ?? SwiftUI.Image(systemName: "book")
                symbolName
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary)
                    .cornerRadius(Settings.MagicNumbers.CornerRadius)
            }
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "😡")
            BookmarkButton(book: Book(title: "title", author: "author", description: "description", microReview: "microReview", readMe: true))
            BookmarkButton(book: .init(readMe: false))
        }
        .previewedAllColorSchemes
    }
}

extension Image {
    init?(title: String) {
        /*
         multistatement guard structure
         */
        guard let character = title.first?.lowercased(),
              case let symbolName = "\(character).square",
              UIImage(systemName: symbolName) != nil else {
            return nil
        }
        
        self.init(systemName: symbolName)
    }
}
extension Book.Image {
    init(title: String) {
        self.init(title: title, uiImage: nil)
    }
}

extension View {
    var previewedAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}

struct BookmarkButton: View {
    @ObservedObject var book: Book
    var body: some View {
        let bookmark = "bookmark"
        Button {
            self.book.readMe.toggle()
        } label: {
            Image(systemName: book.readMe ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .ultraLight))
        }
    }
}
