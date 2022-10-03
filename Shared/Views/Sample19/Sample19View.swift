//
//  Sample19View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/10/03.
//

import SwiftUI
import SlidingTabView

struct Sample19View: View {
    @State private var selectedTabIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
            SlidingTabView(
                selection: $selectedTabIndex,
                tabs: ["First", "Second"]
            )
            (selectedTabIndex == 0 ? Text("First View") : Text("Second View"))
                .padding()
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarHidden(true)
    }
}

struct Sample19View_Previews: PreviewProvider {
    static var previews: some View {
        Sample19View()
    }
}
