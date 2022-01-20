//
//  Sample6View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by yusaku maki on 2022/01/20.
//

import SwiftUI
import AuthenticationServices

struct Sample6View: View {
    @StateObject var viewModel = Sample6ViewModel()
    @Environment(\.colorScheme) var colorScheme

    var isDarkMode: Bool {
        colorScheme == .dark
    }

    var body: some View {
        VStack {
        SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName, .email]
        } onCompletion: { authResults in
            viewModel.appleAuthResults = authResults
        }
        .signInWithAppleButtonStyle(isDarkMode ? .white : .black)
        .frame(width: 224, height: 40)
        }
    }
}

struct Sample6View_Previews: PreviewProvider {
    static var previews: some View {
        Sample6View()
    }
}
