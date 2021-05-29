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
        let author: String
        var body: some View {
            let symbolName = SwiftUI.Image(title: title) ?? SwiftUI.Image(systemName: "book")
            symbolName
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(Font.title.weight(.light))
                .foregroundColor(.secondary)
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title, author: "ez")
            Book.Image(title: "", author: "!23")
            Book.Image(title: "😡", author: "kekw")
        }
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
