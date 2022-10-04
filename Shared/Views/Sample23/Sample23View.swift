//
//  Sample23View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/04.
//

import SwiftUI

struct Sample23View: View {
    @State var isShowHalfModal = false

    var body: some View {
        VStack {
            Button("Show half modal") {
                isShowHalfModal.toggle()
            }
        }
        .halfModal(isShow: $isShowHalfModal) {
            Text("Test")
        }
    }
}

struct Sample23View_Previews: PreviewProvider {
    static var previews: some View {
        Sample23View()
    }
}

extension View {
    func halfModal<Sheet: View>(
        isShow: Binding<Bool>,
        @ViewBuilder sheet: @escaping () -> Sheet
    ) -> some View {
        return self
            .background(
                HalfModalView(
                    sheet: sheet(),
                    isShow: isShow
                )
            )
    }
}

struct HalfModalView<Sheet: View>: UIViewControllerRepresentable {
    var sheet: Sheet
    @Binding var isShow: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(
        _ viewController: UIViewController,
        context: Context
    ) {
        if isShow {
            let sheetController = HalfModalHostingController(rootView: sheet)
            sheetController.presentationController!.delegate = context.coordinator
            viewController.present(sheetController, animated: true)
        } else {
            viewController.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfModalView

        init(parent: HalfModalView) {
            self.parent = parent
        }

        func presentationControllerDidDismiss(
            _ presentationController: UIPresentationController
        ) {
            parent.isShow = false
        }
    }

    class HalfModalHostingController<Content: View>: UIHostingController<Content> {
        override func viewDidLoad() {
            super.viewDidLoad()
            if let sheet = self.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 13.0
            }
        }
    }
}
