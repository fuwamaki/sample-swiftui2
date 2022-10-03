//
//  Sample21View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/03.
//

import SwiftUI

struct Sample21View: View {
    @State private var selectedTab: Int = 0
    @State private var canSwipe: Bool = false

    let list: [String] = ["Test1", "Test2", "Test3"]

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            TopTabView(list: list, selectedTab: $selectedTab)
            TabView(selection: $selectedTab,
                    content: {
                Text("FirstView")
                    .tag(0)
                Text("SecondView")
                    .tag(1)
                Text("ThirdView")
                    .tag(2)
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Test")
    }
}

struct Sample21View_Previews: PreviewProvider {
    static var previews: some View {
        Sample21View()
    }
}

struct Tab {
    var icon: Image?
    var title: String
}

struct TopTabView: View {
    let list: [String]
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< list.count, id: \.self) { row in
                Button(action: {
                    withAnimation {
                        selectedTab = row
                    }
                }, label: {
                    VStack(spacing: 0) {
                        HStack {
                            Text(list[row])
                                .font(Font.system(size: 18, weight: .semibold))
                                .foregroundColor(Color.primary)
                        }
                        .frame(
                            width: (UIScreen.main.bounds.width / CGFloat(list.count)),
                            height: 48 - 3
                        )
                        Rectangle()
                            .fill(selectedTab == row ? Color.green : Color.clear)
                            .frame(height: 3)
                    }
                    .fixedSize()
                })
            }
        }
        .frame(height: 48)
        .background(Color.white)
        .compositingGroup()
        .shadow(color: .primary.opacity(0.2), radius: 3, x: 4, y: 4)
    }
}
