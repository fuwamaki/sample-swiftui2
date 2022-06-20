//
//  Sample13View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/19.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample13View: View {
    @State var availability: WeatherAvailability?

    var body: some View {
        List {
            Sample8Cell(title: "alertAvailability", value: availability?.alertAvailability.rawValue ?? "")
            Sample8Cell(title: "minuteAvailability", value: availability?.minuteAvailability.rawValue ?? "")
        }
        .navigationTitle(Text("WeatherAvailability"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 37.779216348911376,
                longitude: 122.38933507802776
            ) // サンフランシスコ
            do {
                availability = try await service.weather(for: location, including: .availability)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample13View_Previews: PreviewProvider {
    static var previews: some View {
        Sample13View()
    }
}
