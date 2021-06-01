//
//  addNewBookView.swift
//  rithMe
//
//  Created by Максим Нуждин on 01.06.2021.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

extension View {
    var customDivider: some View {
        Divider()
            .padding(.vertical)
}
}

struct addNewBookView: View {
    @State var book: Book
    @State var showingImagePicker: Bool
    @State var image: UIImage?
    var body: some View {
        VStack {
            TextField("Author: ", text: $book.author)
            customDivider
            TextField("Title: ", text: $book.title)
            customDivider
            TextField("Review: ", text: $book.microReview)
            customDivider
            Book.Image(title: book.title, uiImage: image)
            Button(action: {
                showingImagePicker.toggle()
            }, label: {
                Text("Update image")
            }).sheet(isPresented: $showingImagePicker) {
                PHPickerViewController.View(image: $image)
            }
            Spacer()
        }
    }
}

struct addNewBookView_Previews: PreviewProvider {
    static var previews: some View {
        addNewBookView(book: .init(), showingImagePicker: false)
    }
}
