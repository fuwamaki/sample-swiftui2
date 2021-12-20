//
//  MockAPIClient.swift
//  Tests iOS
//
//  Created by fuwamaki on 2021/12/20.
//

import Foundation
@testable import SampleSwiftUI2

class MockAPIClient: APIClientable {
    private let isSuccess: Bool

    required init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }

    func fetchQiitaItem() async throws -> [QiitaItem] {
        if isSuccess {
            return [QiitaItem(title: "title")]
        } else {
            throw NSError(domain: "api error", code: 400, userInfo: nil)
        }
    }
}
