//
//  Sample15TestView.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/09/23.
//

import SwiftUI

struct Sample15TestView: View {
    var text: String

    var body: some View {
        Text(text)
    }
}

struct Sample15TestView_Previews: PreviewProvider {
    static var previews: some View {
        Sample15TestView(text: "test")
    }
}
