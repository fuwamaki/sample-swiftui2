//
//  Sample17View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

struct Sample17View: View {
    @ObservedObject var alertObject = AlertObject()

    var body: some View {
        VStack {
            Button("Show") {
                alertObject.showSingle(
                    title: "title",
                    message: "message",
                    choiceText: "choice"
                )
            }
        }
        .alert(isPresented: $alertObject.isShow) {
            alertObject.alert
        }
    }
}

struct Sample17View_Previews: PreviewProvider {
    static var previews: some View {
        Sample17View()
    }
}
