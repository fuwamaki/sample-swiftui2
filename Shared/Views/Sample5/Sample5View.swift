//
//  Sample5View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/23.
//

import SwiftUI

struct Sample5View: View {
    @State var itemList: [SampleItem] = []

    var body: some View {
        List {
            ForEach(itemList, id: \.self) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .navigationTitle("List")
        .navigationBarItems(trailing: Button(
            action: {
                print("aa")
            }, label: {
                Text("post")
            })
        )
        .task {
            do {
                let (data, _) = try await URLSession.shared.data(
                    from: URL(string: "https://item-server.herokuapp.com/items")!
                )
                let response = try JSONDecoder().decode(SampleItemResponse.self, from: data)
                itemList = response.data
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct SampleItemResponse: Codable {
    let data: [SampleItem]
}

struct SampleItem: Codable, Hashable {
    let id: Int
    let name: String
    let category: String
    let price: Int
}

struct Sample5View_Previews: PreviewProvider {
    static var previews: some View {
        Sample5View()
    }
}
