//
//  Sample16View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

struct Sample16View: View {
    @State var isShowAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""

    // deprecatedになるらしい
    var body: some View {
        VStack {
            Button("Show") {
                alertTitle = "タイトル"
                alertMessage = "メッセージ"
                isShowAlert.toggle()
            }
        }
        .alert(isPresented: $isShowAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")))
        }
    }
}

struct Sample16View_Previews: PreviewProvider {
    static var previews: some View {
        Sample16View()
    }
}
