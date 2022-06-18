//
//  Sample11View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample11View: View {
    @State var dayWeathers: [DayWeather] = []

    var body: some View {
        List {
            ForEach(dayWeathers, id: \.self.date) { weather in
                Sample8Cell(title: weather.date.description, value: weather.precipitation.description)
            }
        }
        .navigationTitle(Text("DayWeather"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 35.467081,
                longitude: 139.620798
            )
            do {
                let forecast = try await service.weather(for: location, including: .daily)
                dayWeathers = forecast.forecast
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample11View_Previews: PreviewProvider {
    static var previews: some View {
        Sample11View()
    }
}
