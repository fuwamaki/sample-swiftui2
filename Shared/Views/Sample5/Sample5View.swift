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
                Task {
                    do {
                        var urlRequest = URLRequest(
                            url: URL(string: "https://item-server.herokuapp.com/create2")!
                        )
                        urlRequest.httpMethod = "POST"
//                        let encoder = JSONEncoder()
//                        encoder.dateEncodingStrategy = .secondsSince1970
//                        encoder.outputFormatting = .prettyPrinted
                        let aaa = """
name=taro&category=human&price=1000
"""
                        urlRequest.httpBody = aaa.data(using: .utf8)
//                        urlRequest.httpBody = try encoder.encode(sampleItemRequestEntity)
                        print(String(data: urlRequest.httpBody!, encoding: .utf8) ?? "")
                        let (data, response) = try await URLSession.shared.data(for: urlRequest)
                        print(response)
                        print(String(data: data, encoding: .utf8) ?? "")
                    }
                }
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

struct Sample5View_Previews: PreviewProvider {
    static var previews: some View {
        Sample5View()
    }
}

// MARK: Entity
struct SampleItemResponse: Codable {
    let data: [SampleItem]
}

struct SampleItem: Codable, Hashable {
    let id: Int
    let name: String
    let category: String
    let price: Int
}

struct SampleItemRequestEntity: Codable {
    let item: SamplePostItem
}

struct SamplePostItem: Codable {
    let name: String
    let category: String
    let price: Int
}

let sampleItemRequestEntity = SampleItemRequestEntity(
    item: samplePostItem
)

let samplePostItem = SamplePostItem(
    name: "taro",
    category: "human",
    price: 1000
)
