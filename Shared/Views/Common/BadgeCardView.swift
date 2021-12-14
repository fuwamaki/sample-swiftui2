//
//  BadgeCardView.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by 牧宥作 on 2021/12/14.
//

import SwiftUI

struct BadgeCardView: View {
    @State var title: String
    @State var value: String
    @State var valueColor: Color

    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.caption2)
                .padding(4.0)
                .foregroundColor(.white)
                .background(Color.gray)
            Text(value)
                .font(.caption2)
                .fontWeight(.bold)
                .padding(4.0)
                .padding(.horizontal, 8.0)
                .foregroundColor(.white)
                .background(valueColor)
        }
        .cornerRadius(8.0)
    }
}

struct BadgeCardView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeCardView(
            title: "Swift Package Manager",
            value: "compatible",
            valueColor: Color.blue
        )
    }
}
