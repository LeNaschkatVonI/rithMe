//
//  Library.swift
//  rithMe
//
//  Created by Максим Нуждин on 29.05.2021.
//

import Foundation

final class LibraryStorage {
    var sortedBooks: [Book] {
        bookStorage.sorted {
            $0.title.count < $1.title.count
        }
    }

    private var bookStorage: [Book] = [
        Book(title: "maxim", author: "god", description: "the beginning"),
        Book(title: "vera", author: "god", description: "the beginning together"),
        Book(title: "swift", author: "apple", description: "programming language"),
        Book(title: "figma guide", author: "eu citizen", description: "UI guidebook"),
        Book(title: "mobile development", author: "world", description: "guidelines to develop mobile apps"),
        Book()
    ]
}
