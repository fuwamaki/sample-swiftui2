//
//  Sample10View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample10View: View {
    @State var hourWeathers: [HourWeather] = []

    var body: some View {
        List {
            ForEach(hourWeathers, id: \.self.date) { weather in
                Sample8Cell(title: weather.date.description, value: weather.precipitation.description)
            }
        }
        .navigationTitle(Text("HourWeather"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 35.467081,
                longitude: 139.620798
            )
            do {
                let forecast = try await service.weather(for: location, including: .hourly)
                hourWeathers = forecast.forecast
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample10View_Previews: PreviewProvider {
    static var previews: some View {
        Sample10View()
    }
}
