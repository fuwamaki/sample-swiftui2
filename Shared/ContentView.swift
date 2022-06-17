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
                NavigationLink {
                    Sample2View()
                } label: {
                    Text("Sample2")
                }
                NavigationLink {
                    Sample3View()
                } label: {
                    Text("Sample3")
                }
                NavigationLink {
                    Sample4View()
                } label: {
                    Text("Sample4")
                }
                NavigationLink {
                    Sample5View()
                } label: {
                    Text("Sample5")
                }
                NavigationLink {
                    Sample6View()
                } label: {
                    Text("Sample6")
                }
                NavigationLink {
                    Sample7View()
                } label: {
                    Text("Sample7")
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
