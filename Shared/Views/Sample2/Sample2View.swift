//
//  Sample2View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/18.
//

import SwiftUI

struct Sample2View: View {
    @State var isRounded: Bool = false

    var body: some View {
        VStack {
            Text("テキスト")
                .padding()
                .background(.yellow)
                .clipShape(Capsule())
                .modifier(CustomShape(isRounded: isRounded))
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
