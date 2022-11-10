//
//  Sample26View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/11/10.
//

import SwiftUI

// 検知が微妙。だめパターン
struct Sample26View: View {
    @State private var isShowNavigationTitle = false
    @State private var title = "複数行表示できるかどうか試しにやってみたけどこんな感じになった"

    var body: some View {
        GeometryReader { geometry in
            List {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                ForEach(1...100, id: \.self) { item in
                    Text(item.description)
                        .onItemFrameChanged(listGeometry: geometry) { _ in
                            isShowNavigationTitle = item > 2 ? true : false
                        }
                }
            }
            .trackListFrame()
        }
        .navigationTitle(isShowNavigationTitle ? title : "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Sample26View_Previews: PreviewProvider {
    static var previews: some View {
        Sample26View()
    }
}

struct ViewFrameKey: PreferenceKey {
    typealias Value = CGRect?
    static var defaultValue: CGRect? = nil
    static func reduce(value: inout Value, nextValue: () -> Value) {
        fatalError("Not implemented")
    }
}

struct ItemFrameTracking: ViewModifier {
    var listGeometry: GeometryProxy
    var frameUpdated: (CGRect?) -> Void

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { itemGeometry in
                    let itemFrameIgnoringSafeArea = itemGeometry
                        .frame(in: .named("ListFrame.Scroll"))
                    let parentListFrame = listGeometry.frame(in: .global)
                    let parentListOffset = parentListFrame.origin
                    let itemFrame = CGRect(
                        origin: CGPoint(
                            x: itemFrameIgnoringSafeArea.origin.x - parentListOffset.x,
                            y: itemFrameIgnoringSafeArea.origin.y - parentListOffset.y
                        ),
                        size: itemFrameIgnoringSafeArea.size)
                    let visible = parentListFrame.intersects(itemFrameIgnoringSafeArea)
                    
                    Color.clear.preference(
                        key: ViewFrameKey.self,
                        value: visible ? itemFrame : nil
                    )
                }
            }
            .onPreferenceChange(ViewFrameKey.self) { frame in
                frameUpdated(frame)
            }
    }
}

struct ListFrameTracking: ViewModifier {
    func body(content: Content) -> some View {
        content
            .coordinateSpace(name: "ListFrame.Scroll")
    }
}

public extension View {
    func onItemFrameChanged(
        listGeometry: GeometryProxy,
        _ frameUpdated: @escaping (CGRect?) -> Void
    ) -> some View {
        modifier(ItemFrameTracking(
            listGeometry: listGeometry,
            frameUpdated: frameUpdated
        ))
    }

    func trackListFrame() -> some View {
        modifier(ListFrameTracking())
    }
}
