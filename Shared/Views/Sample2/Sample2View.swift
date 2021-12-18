//
//  Sample2View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/18.
//

import SwiftUI

struct Sample2View: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
            Text("Hello, World!")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct Sample2View_Previews: PreviewProvider {
    static var previews: some View {
        Sample2View()
    }
}
