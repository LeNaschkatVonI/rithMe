//
//  Book.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import Foundation

struct Book {
    let author: String
    let title: String
    let description: String?
    
    init(title: String = "Title", author: String = "Author" , description: String = "") {
        self.title = title
        self.author = author
        self.description = description
    }
}

