//
//  ContentView.swift
//  rithMe
//
//  Created by Максим Нуждин on 28.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0..<5) { item in
            BookRow(title: "maxim\(item)", author: "god")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

