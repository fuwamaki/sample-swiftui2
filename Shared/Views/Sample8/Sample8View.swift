//
//  Sample8View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/17.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample8View: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .task {
            Task.detached { @MainActor in
                let service = WeatherService()
                let location = CLLocation(
                    latitude: 35.467081,
                    longitude: 139.620798
                )
                do {
                    let weather = try await service.weather(for: location)
                    let temperature = weather.currentWeather.temperature
                    print(temperature)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct Sample8View_Previews: PreviewProvider {
    static var previews: some View {
        Sample8View()
    }
}
