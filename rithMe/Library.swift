//
//  Library.swift
//  rithMe
//
//  Created by Максим Нуждин on 29.05.2021.
//

import class UIKit.UIImage
import Combine

enum Section: CaseIterable {
    case readMe
    case finished
}

final class LibraryStorage: ObservableObject {
    var sortedBooks: [Book] {
        bookStorage.sorted {
            $0.title.count < $1.title.count
        }
    }
    var manuallySortedBooks: [Section: [Book]] {
        Dictionary(grouping: sortedBooks, by: \.readMe)
            .mapKeys(Section.init)
    }
    @Published var uiImages: [Book: UIImage] = [:]
    
    init() {
        sortedBooks.forEach(storeCancellables)
    }
    
    /// adds a new book to sortedBooks array
    func addNewBook(book: Book, image: UIImage?) {
        bookStorage.insert(book, at: 0)
        uiImages[book] = image
        storeCancellables(book: book)
    }

    @Published private var bookStorage: [Book] = [
        Book(title: "maxim", author: "god", description: "the beginning", microReview: "true god"),
        Book(title: "vera", author: "god", description: "the beginning together", microReview: "false god"),
        Book(title: "swift", author: "apple", description: "programming language"),
        Book(title: "figma guide", author: "eu citizen", description: "UI guidebook"),
        Book(title: "mobile development", author: "world", description: "guidelines to develop mobile apps", microReview: "awesome"),
    ]
    private var cancellables: Set<AnyCancellable> = []
}

private extension LibraryStorage {
    func storeCancellables(book: Book) {
        book.$readMe.sink { [unowned self] _ in
            objectWillChange.send()
        }.store(in: &cancellables)
    }
}

private extension Section {
    init(readMe: Bool) {
        self = readMe ? .readMe : .finished
    }
}

private extension Dictionary {
    func mapKeys<Transformed>(
        _ transform: (Key) throws -> Transformed
    ) rethrows -> [Transformed: Value] {
        .init(uniqueKeysWithValues: try map { (try transform($0.key), $0.value)})
    }
}

