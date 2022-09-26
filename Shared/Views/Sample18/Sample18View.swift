//
//  Sample18View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

struct Sample18View: View {
    @State var isShowAlert: Bool = false
    @State var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        VStack {
            Button("Show") {
                alertEntity = AlertEntity(
                    title: "タイトル",
                    message: "メッセージ",
                    actionText: "OK"
                )
                isShowAlert.toggle()
            }
        }
        .alert(
            alertEntity?.title ?? "",
            isPresented: $isShowAlert,
            presenting: alertEntity
        ) { entity in
            Button(entity.actionText) {
                print(entity.actionText)
            }
            .bold() // 無反応
            .foregroundColor(.red) // 無反応
        } message: { entity in
            Text(entity.message)
        }
    }
}

struct Sample18View_Previews: PreviewProvider {
    static var previews: some View {
        Sample16View()
    }
}
