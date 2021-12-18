//
//  Sample3View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/18.
//

import SwiftUI

struct Sample3View: View {
    @State var itemList: [QiitaItem] = []

    var body: some View {
        List {
            ForEach(itemList, id: \.self) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    HStack {
                        Text("test")
                            .font(.caption2)
                            .padding(4.0)
                            .foregroundColor(.white)
                            .background(Color.gray)
                    }
                    .cornerRadius(8.0)
                }
            }
        }
        .navigationTitle("List")
        .task {
            do {
                let (data, _) = try await URLSession.shared.data(
                    from: URL(string: "https://qiita.com/api/v2/tags/swift/items")!
                )
                itemList = try JSONDecoder().decode([QiitaItem].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct QiitaItem: Codable, Hashable {
    var title: String
    var url: String
}

struct Sample3View_Previews: PreviewProvider {
    static var previews: some View {
        Sample3View()
    }
}
