//
//  Sample12Cell.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI

struct Sample12Cell: View {
    var title: String
    var value: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
            }
            HStack {
                Text(value)
                Spacer()
            }
        }
    }
}

struct Sample12Cell_Previews: PreviewProvider {
    static var previews: some View {
        Sample12Cell(title: "title", value: "value")
    }
}
