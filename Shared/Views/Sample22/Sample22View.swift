//
//  Sample22View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/04.
//

import SwiftUI

struct Sample22View: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            TextField("TextField",text: self.$text, axis: .vertical)
                .lineLimit(5...10)
                .padding(8)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(13.0)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Text("keyboard")
                    }
                }
            Spacer()
        }
        .padding(16.0)
        .navigationTitle("Test")
    }
}

struct Sample22View_Previews: PreviewProvider {
    static var previews: some View {
        Sample22View()
    }
}
