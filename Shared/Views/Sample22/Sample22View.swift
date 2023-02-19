//
//  Sample22View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/04.
//

import SwiftUI

struct Sample22View: View {
    @State private var text: String = ""
    @FocusState var isFocus: Bool

    var body: some View {
        ZStack {
            VStack {
                Text("space")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                isFocus = false
            }
            MessageInputView(text: $text, isFocus: _isFocus)
        }
        .navigationTitle("Test")
    }
}

struct Sample22View_Previews: PreviewProvider {
    static var previews: some View {
        Sample22View()
    }
}

struct MessageInputView: View {
    @Binding var text: String
    @FocusState var isFocus: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Divider()
            HStack(alignment: .bottom) {
                TextField("TextField",text: self.$text, axis: .vertical)
                    .padding(8)
                    .lineLimit(1...10)
                    .frame(minHeight: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8.0)
                    .focused($isFocus)
                Button {
                } label: {
                    Text("Send")
                        .frame(width: 72, height: 40)
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                }
            }
            .padding(8)
            .background(Color.white)
        }
    }
}
