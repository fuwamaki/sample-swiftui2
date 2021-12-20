//
//  Sample4APIClient.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/20.
//

import Foundation

protocol APIClientable {
    func fetchQiitaItem() async throws -> [QiitaItem]
}

class APIClient: APIClientable {
    func fetchQiitaItem() async throws -> [QiitaItem] {
        let (data, response) = try await URLSession.shared.data(
            from: URL(string: "https://qiita.com/api/v2/tags/swift/items")!
        )
        guard let httpResponse = response as? HTTPURLResponse,
              (200 <= httpResponse.statusCode && httpResponse.statusCode < 300) else {
                  throw NSError(domain: "api error", code: 400, userInfo: nil)
              }
        return try JSONDecoder().decode([QiitaItem].self, from: data)
    }
}
