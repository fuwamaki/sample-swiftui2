//
//  CalendarView.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/09.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        UICalendarView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
