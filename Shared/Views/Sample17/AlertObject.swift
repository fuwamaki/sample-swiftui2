//
//  AlertObject.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

class AlertObject: ObservableObject {
    @Published var isShow: Bool = false
    @Published var title: String = "エラー"
    @Published var message: String? = "不具合が発生しました。お手数ですが時間をおいてもう一度お試しください。"
    @Published var choiceText: String = "OK"
    @Published var defaultAction: (() -> Void)?
    @Published var cancelAction: (() -> Void)?
    @Published var showAlertType: AlertType = .single

    enum AlertType {
        case single
        case double
    }

    var alert: Alert {
        switch showAlertType {
        case .single:
            return Alert(
                title: Text(title),
                message: message == nil ? nil : Text(message!),
                dismissButton: defaultAction == nil
                ? .default(Text(choiceText))
                : .default(Text(choiceText), action: defaultAction)
            )
        case .double:
            return Alert(
                title: Text(title),
                message: message == nil ? nil : Text(message!),
                primaryButton: defaultAction == nil
                ? .default(Text(choiceText))
                : .default(Text(choiceText), action: defaultAction),
                secondaryButton: .cancel(cancelAction)
            )
        }
    }

    func showError(message: String) {
        self.title = "エラー"
        self.message = message
        self.choiceText = "OK"
        self.showAlertType = .single
        self.defaultAction = nil
        self.cancelAction = nil
        self.isShow.toggle()
    }

    func showSingle(
        title: String,
        message: String?,
        choiceText: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.choiceText = choiceText ?? "OK"
        self.defaultAction = action
        self.showAlertType = .single
        self.isShow.toggle()
    }

    func showDouble(
        title: String,
        message: String?,
        choiceText: String? = nil,
        action: (() -> Void)? = nil,
        cancelAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.choiceText = choiceText ?? "OK"
        self.defaultAction = action
        self.cancelAction = cancelAction
        self.showAlertType = .double
        self.isShow.toggle()
    }
}
