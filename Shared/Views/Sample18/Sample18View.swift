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
    }

    var body: some View {
        VStack {
            Button("Show") {
                alertEntity = AlertEntity(title: "タイトル", message: "メッセージ")
                isShowAlert.toggle()
            }
            Button("Show") {
                alertEntity = AlertEntity(title: "タイトル2", message: "メッセージ2")
                isShowAlert.toggle()
            }
        }
        .alert(
            alertEntity?.title ?? "",
            isPresented: $isShowAlert,
            presenting: alertEntity
        ) { entity in
            Button("Cancel") { print("Cancel") }
            Button("OK") { print("OK") }
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
