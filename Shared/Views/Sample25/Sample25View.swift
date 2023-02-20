//
//  Sample25View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/11/10.
//

import SwiftUI

struct Sample25View: View {
    @State private var isShowNavigationTitle = false
    @State private var title = "複数行表示できるかどうか試しにやってみたけどこんな感じになった"

    var body: some View {
        ScrollView {
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                ForEach(1...100, id: \.self) { item in
                    Text(item.description)
                }
            }
            .background(GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    let offset = -proxy.frame(in: .named("scroll")).origin.y
                    print("offset >> \(offset)")
                    isShowNavigationTitle = offset > 100.0 ? true : false
                }
                return Color.clear
            })
        }
        .coordinateSpace(name: "scroll")
        .navigationTitle(isShowNavigationTitle ? title : "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Sample25View_Previews: PreviewProvider {
    static var previews: some View {
        Sample25View()
    }
}
