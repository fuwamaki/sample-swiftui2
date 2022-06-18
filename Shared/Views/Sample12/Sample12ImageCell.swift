//
//  Sample12ImageCell.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI

struct Sample12ImageCell: View {
    var title: String
    var value: URL?

    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
            }
            HStack {
                Text(value?.description ?? "")
                Spacer()
            }
            HStack {
                AsyncImage(url: value) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                } placeholder: {
                    ProgressView()
                }
                Spacer()
            }
        }
    }
}

struct Sample12ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        Sample12ImageCell(title: "title", value: nil)
    }
}
