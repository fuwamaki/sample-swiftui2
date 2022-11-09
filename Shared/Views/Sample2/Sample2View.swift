//
//  Sample2View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/18.
//

import SwiftUI
import UIKit

struct Sample2View: View {
    @State var isRounded: Bool = false
    @State var text: String = "サンプルテキスト\nhttps://www.google.com\nです"

    var body: some View {
        VStack {
            Text("テキスト")
                .padding()
                .background(.yellow)
                .clipShape(Capsule())
                .modifier(CustomShape(isRounded: isRounded))
            CustomTextView(text: $text)
            Spacer()
        }
    }
}

struct CustomShape: ViewModifier {
    var isRounded: Bool

    func body(content: Content) -> some View {
        if isRounded {
            content
                .clipShape(Capsule())
        } else {
            content
                .clipShape(Rectangle())
        }
    }
}

struct Sample2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2View()
    }
}


struct CustomTextView: UIViewRepresentable {
    let textView = UITextView()
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        textView.delegate = context.coordinator
        textView.isEditable = false
        textView.isSelectable = true
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .darkGray
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.link
        ]
        textView.dataDetectorTypes = .link
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            self._text = text
        }

        func textViewDidChange(_ textView: UITextView) {
            _text.wrappedValue = textView.text
        }
    }
}
