//
//  Sample12View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample12View: View {
    @State var attribution: WeatherAttribution?

    var body: some View {
        List {
            Sample8Cell(title: "name", value: attribution?.serviceName ?? "")
            Sample8Cell(title: "legalPageURL", value: attribution?.legalPageURL.description ?? "")
            Sample12ImageCell(title: "squareMarkURL", value: attribution?.squareMarkURL)
            Sample12ImageCell(title: "combinedMarkDarkURL", value: attribution?.combinedMarkDarkURL)
            Sample12ImageCell(title: "combinedMarkLightURL", value: attribution?.combinedMarkLightURL)
        }
        .navigationTitle(Text("WeatherAttribution"))
        .task {
            let service = WeatherService()
            do {
                attribution = try await service.attribution
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample12View_Previews: PreviewProvider {
    static var previews: some View {
        Sample12View()
    }
}
