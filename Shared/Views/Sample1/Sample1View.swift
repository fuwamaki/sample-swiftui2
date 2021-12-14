//
//  Sample1View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by 牧宥作 on 2021/12/14.
//

import SwiftUI

struct Sample1View: View {
    var body: some View {
        VStack {
            BadgeCardView(title: "test", value: "value", valueColor: .blue)
            Circle()
                .fill(Color.blue)
                .frame(width:250, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width:250, height: 200)
        }
        .navigationTitle("Sample1")
    }
}

struct Sample1View_Previews: PreviewProvider {
    static var previews: some View {
        Sample1View()
    }
}
