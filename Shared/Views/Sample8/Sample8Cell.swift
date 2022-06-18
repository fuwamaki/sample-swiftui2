//
//  Sample8Cell.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI

struct Sample8Cell: View {
    var title: String
    var value: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                Text(value)
            }
        }
    }
}

struct Sample8Cell_Previews: PreviewProvider {
    static var previews: some View {
        Sample8Cell(title: "title", value: "value")
    }
}
