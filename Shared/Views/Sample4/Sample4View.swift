//
//  Sample4View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2021/12/20.
//

import SwiftUI

struct Sample4View: View {
    @StateObject var viewModel = Sample4ViewModel()

    var body: some View {
        List {
            ForEach(viewModel.items, id: \.self) { item in
                Text(item.title)
            }
        }
        .navigationTitle("List")
        .alert(isPresented: $viewModel.isShowAlert) {
            Alert(
                title: Text("エラー"),
                message: Text(viewModel.alertText),
                dismissButton: .default(Text("OK")))
        }
        .task {
            await viewModel.fetch()
        }
    }
}

struct Sample4View_Previews: PreviewProvider {
    static var previews: some View {
        Sample4View()
    }
}
