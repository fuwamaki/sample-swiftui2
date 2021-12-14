//
//  ContentView.swift
//  Shared
//
//  Created by 牧宥作 on 2021/12/14.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowContentView: Bool = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Sample1View()
                } label: {
                    Text("Sample1")
                }
            }
            .navigationTitle(isShowContentView ? "Home" : "")
            .onAppear {
                isShowContentView = true
            }
            .onDisappear {
                isShowContentView = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
