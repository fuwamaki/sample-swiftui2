//
//  Sample4ViewModelTest.swift
//  Tests iOS
//
//  Created by fuwamaki on 2021/12/20.
//

import XCTest
@testable import SampleSwiftUI2

class Sample4ViewModelTest: XCTestCase {

    func testFetchWithSuccess() async throws {
        let mockAPIClient: APIClientable = MockAPIClient(isSuccess: true)
        let viewModel = Sample4ViewModel(apiClient: mockAPIClient)
        await viewModel.fetch()
        XCTAssertEqual(viewModel.items.count, 1)
        XCTAssertFalse(viewModel.isShowAlert)
    }

    func testFetchWithFailure() async throws {
        let mockAPIClient: APIClientable = MockAPIClient(isSuccess: false)
        let viewModel = Sample4ViewModel(apiClient: mockAPIClient)
        await viewModel.fetch()
        XCTAssertEqual(viewModel.items.count, 0)
        XCTAssertTrue(viewModel.isShowAlert)
    }
}
