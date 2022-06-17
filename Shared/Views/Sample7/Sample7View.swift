//
//  Sample7View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/09.
//

import SwiftUI

struct Sample7View: View {
    var body: some View {
        CalendarView()
            .padding()
            .navigationTitle("UICalendarView")
    }
}

struct Sample7View_Previews: PreviewProvider {
    static var previews: some View {
        Sample7View()
    }
}
