//
//  Sample24View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/31.
//

import SwiftUI

struct Sample24View: View {
    @State private var selectedTab: Int = 0
    let list: [String] = ["Test1", "Test2"]

    var body: some View {
        List {
            VStack(alignment: .center) {
                Text("AAA")
                Text("BBB")
                Text("CCC")
                Text("DDD")
                Text("EEE")
            }
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            Section(
                header: TopTabView(
                    list: list,
                    selectedTab: $selectedTab
                )) {
                    Group {
                        Text("りんご")
                        Text("れもん")
                        Text("もも")
                        Text("ぶどう")
                        Text("かき")
                        Text("みかん")
                        Text("なし")
                        Text("すいか")
                        Text("ばなな")
                        Text("めろん")
                    }
                    Group {
                        Text("りんご")
                        Text("れもん")
                        Text("もも")
                        Text("ぶどう")
                        Text("かき")
                        Text("みかん")
                        Text("なし")
                        Text("すいか")
                        Text("ばなな")
                        Text("めろん")
                    }
                }
        }
        .listStyle(.plain)
        .navigationTitle("2022年12月12日(月) 12:00")
    }
}

struct Sample24View_Previews: PreviewProvider {
    static var previews: some View {
        Sample24View()
    }
}
