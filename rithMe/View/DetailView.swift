//
//  DetailView.swift
//  rithMe
//
//  Created by Максим Нуждин on 29.05.2021.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State private var showingImagePicker = false
    @State private var showingAlert = false
    @State private var showingReviewSheet = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    BookmarkButton(book: book)
                    VStack {
                        Text(book.title.capitalized)
                            .font(Settings.BookFonts.Title)
                            .bold()
                        Text(book.author.capitalized)
                            .font(Settings.BookFonts.Author)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button(action: {
                        showingReviewSheet.toggle()
                    }, label: {
                        Text("Edit review")
                    })
                }
                Divider()
                    .padding(.vertical)
                Book.Image(title: book.title, uiImage: image)
                
                HStack(alignment: .center) {
                    Button(action: {
                        showingImagePicker.toggle()
                    }, label: {
                        Text("Upload image")
                    })
                    if image != nil {
                        Spacer()
                        Button(action: {
                            showingAlert.toggle()
                        }, label: {
                            Text("Delete image")
                        })
                    }
                }.padding()
                if showingReviewSheet {
                    Divider()
                        .padding(.vertical)
                    Section(header: Text("Write your review right below")) {
                        TextField("review", text: $book.microReview)
                            .foregroundColor(.secondary)
                    }
                } else {
                    Divider()
                        .padding(.vertical)
                    Text(book.microReview)
                }
                Divider()
                    .padding(.vertical)
                Text(book.description?.capitalized ?? "This book still have no description")
                    .font(Settings.BookFonts.Description)
                Spacer()
            }.padding()
            .sheet(isPresented: $showingImagePicker) {
                PHPickerViewController.View(image: $image)
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: .init("delete image for \(book.title)"), primaryButton: Alert.Button.destructive(Text("delete"), action: { image = nil}), secondaryButton: .cancel())
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book(), image: .constant(nil))
            .previewedAllColorSchemes
    }
}
