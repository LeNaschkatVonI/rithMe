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
    @EnvironmentObject var library: LibraryStorage
    @State private var showingImagePicker = false
    @State private var showingAlert = false
    @State private var showingReviewSheet = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                titleAndAuthor(book: book, showingReviewSheet: $showingReviewSheet)
                customDivider
                VStack {
                    Book.Image(title: book.title, uiImage: library.uiImages[book])
                
                HStack(alignment: .center) {
                    Button(action: {
                        showingImagePicker.toggle()
                    }, label: {
                        Text("Upload image")
                    })
                    if library.uiImages[book] != nil {
                        Spacer()
                        Button(action: {
                            showingAlert.toggle()
                        }, label: {
                            Text("Delete image")
                        })
                    }
                }.padding()
                if showingReviewSheet {
                    customDivider
                        TextField("review", text: $book.microReview)
                            .foregroundColor(.secondary)
                } else {
                   customDivider
                    Text(book.microReview)
                }
                }
                customDivider
                Text(book.description?.capitalized ?? "This book still have no description")
                    .font(Settings.BookFonts.Description)
                Spacer()
            }.padding()
            .sheet(isPresented: $showingImagePicker) {
                PHPickerViewController.View(image: $library.uiImages[book])
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: .init("delete image for \(book.title)"), primaryButton: Alert.Button.destructive(Text("delete"), action: { library.uiImages[book] = nil}), secondaryButton: .cancel())
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book())
        .environmentObject(LibraryStorage())
            .previewedAllColorSchemes
    }
}

struct titleAndAuthor: View {
    @ObservedObject var book: Book
    @Binding var showingReviewSheet: Bool
    var body: some View {
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
    }
}
