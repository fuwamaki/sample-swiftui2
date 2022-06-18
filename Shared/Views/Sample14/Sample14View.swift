//
//  Sample14View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/19.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample14View: View {
    @State var alerts: [WeatherAlert] = []

    var body: some View {
        List {
            ForEach(alerts, id: \.self.region) { alert in
                Sample8Cell(title: "summary", value: alert.summary)
            }
        }
        .navigationTitle(Text("WeatherAlert"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 37.779216348911376,
                longitude: 122.38933507802776
            ) // サンフランシスコ
            do {
                alerts = try await service.weather(for: location, including: .alerts) ?? []
                print(alerts)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample14View_Previews: PreviewProvider {
    static var previews: some View {
        Sample14View()
    }
}
