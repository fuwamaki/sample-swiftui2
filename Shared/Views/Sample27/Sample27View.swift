//
//  Sample27View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/11/10.
//

import SwiftUI

// 良い良い
struct Sample27View: View {
    @State private var isShowNavigationTitle = false
    @State private var title = "複数行表示できるかどうか試しにやってみたけどこんな感じになった"

    var body: some View {
        List {
            Text(title)
                .font(.largeTitle)
                .bold()
                .overlay(
                    GeometryReader { geo -> AnyView in
                        DispatchQueue.main.async {
                            isShowNavigationTitle = geo.frame(in: .global).minY < CGFloat.zero
                        }
                        return AnyView(EmptyView())
                    }
                )
            ForEach(1...100, id: \.self) { item in
                Text(item.description)
            }
        }
        .navigationTitle(isShowNavigationTitle ? title : "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Sample27View_Previews: PreviewProvider {
    static var previews: some View {
        Sample27View()
    }
}
