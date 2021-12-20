//
//  Sample4ViewModel.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/20.
//

import Foundation

final class Sample4ViewModel: ObservableObject {
    @Published var items: [QiitaItem] = []
    @Published var isShowAlert: Bool = false
    @Published var alertText: String = ""

    private let apiClient: APIClientable

    convenience init() {
        self.init(apiClient: APIClient())
    }

    init(apiClient: APIClientable) {
        self.apiClient = apiClient
    }

    func fetch() async {
        do {
            let response = try await apiClient.fetchQiitaItem()
            await setItems(response)
        } catch let error {
            await showAlert(error)
        }
    }

    @MainActor private func setItems(_ items: [QiitaItem]) {
        self.items = items
    }

    @MainActor private func showAlert(_ error: Error) {
        self.isShowAlert.toggle()
        self.alertText = error.localizedDescription
    }
}
