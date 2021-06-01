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
    @ObservedObject var book = Book.init()
    @State var showingImagePicker: Bool = false
    @State var image: UIImage?
    @EnvironmentObject var library: LibraryStorage
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
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
            }.padding()
            .navigationBarTitle("New book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("add to library") {
                        library.addNewBook(book: book, image: image)
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    .disabled(
                        [book.title, book.author].contains(where: \.isEmpty)
                    )
                }
            }
            }
    }
}

struct addNewBookView_Previews: PreviewProvider {
    static var previews: some View {
        addNewBookView(book: .init(), showingImagePicker: false)
            .environmentObject(LibraryStorage())
    }
}
