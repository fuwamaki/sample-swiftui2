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
                alertObject.showSingle(
                    title: "シングル",
                    message: "メッセージ"
                )
            }
            Button("Show Double") {
                alertObject.showDouble(
                    title: "ダブル",
                    message: "メッセージ"
                )
            }
        }
        .customAlert(for: alertObject)
    }
}

struct Sample17View_Previews: PreviewProvider {
    static var previews: some View {
        Sample17View()
    }
}

extension View {
    func customAlert(for alertObject: AlertObject) -> some View {
        modifier(CustomAlertView(alertObject: alertObject))
    }
}

struct CustomAlertView: ViewModifier {
    @ObservedObject var alertObject: AlertObject

    func body(content: Content) -> some View {
        content
            .alert(
                alertObject.model?.title ?? "",
                isPresented: $alertObject.isShow,
                presenting: alertObject.model
            ) {
                $0.actionView
            } message: {
                $0.messageView
            }
    }
}
