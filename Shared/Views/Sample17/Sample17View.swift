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
            Button("Show Error") {
                alertObject.showError(message: "message")
            }
            Button("Show Single") {
                alertObject.showSingle(title: "うおー", message: "おりゃ")
            }
            Button("Show Double") {
                alertObject.showDouble(title: "ははは", message: "たたた")
            }
        }
        .alert(
            alertObject.model?.title ?? "",
            isPresented: $alertObject.isShow,
            presenting: alertObject.model
        ) { model in
            model.actionView
        } message: { model in
            model.messageView
        }
    }
}

struct Sample17View_Previews: PreviewProvider {
    static var previews: some View {
        Sample17View()
    }
}
