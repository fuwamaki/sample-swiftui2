//
//  ContentView.swift
//  Shared
//
//  Created by 牧宥作 on 2021/12/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Sample1View()
                } label: {
                    Text("Sample1")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
