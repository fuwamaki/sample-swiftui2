//
//  Sample6ViewModel.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by yusaku maki on 2022/01/20.
//

import Combine
import AuthenticationServices

final class Sample6ViewModel: ObservableObject {
    @Published var appleAuthResults: Result<ASAuthorization, Error>?
    private var disposables = Set<AnyCancellable>()

    init() {
        $appleAuthResults
            .sink(receiveValue: { results in
                switch results {
                case .success(let authResults):
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        print("userIdentifier:\(appleIDCredential.user)")
                        print("fullName:\(String(describing: appleIDCredential.fullName))")
                        print("email:\(String(describing: appleIDCredential.email))")
                        print("authorizationCode:\(String(describing: appleIDCredential.authorizationCode))")
                        print("ここでログイン処理を呼び出す")
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                default:
                    break
                }
            })
            .store(in: &disposables)
    }
}
