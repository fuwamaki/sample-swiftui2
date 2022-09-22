//
//  Sample15View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

struct Sample15View: View {
    @State private var isShow = false
    @State private var path: [String] = []
    @State private var textList: [String] = ["a", "b", "c"]
    @State private var selection: String? = nil

    var body: some View {
        NavigationLink {
            Sample15TestView(text: "aaa")
        } label: {
            Text("test")
        }
        // これの代わりが
        NavigationLink("Hey", isActive: $isShow) {
            Sample15TestView(text: "HHH")
        }
        // これだな
        Button("Next") {
            isShow.toggle()
        }
        .navigationDestination(isPresented: $isShow) {
            Sample15TestView(text: "HHH")
        }

        // Navigation2重になるじゃん、クソすぎる
//        NavigationStack(path: $path) {
//            List {
//                NavigationLink("Purple", value: "Purple")
//                NavigationLink("Pink", value: "Pink")
//                NavigationLink("Orange", value: "Orange")
//            }
//            .navigationDestination(for: String.self) { text in
//                Sample15TestView(text: text)
//            }
//        }

        // Navigation2重になるじゃん、クソすぎる
//        NavigationSplitView {
//            List(textList, id: \.self, selection: $selection) { text in
//                NavigationLink(text, value: text)
//            }
//        } detail: {
//            if let text = selection {
//                Sample15TestView(text: text)
//            } else {
//                Text("Waaa")
//            }
//        }
    }
}

struct Sample15View_Previews: PreviewProvider {
    static var previews: some View {
        Sample15View()
    }
}
