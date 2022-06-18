//
//  Sample9View.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2022/06/18.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct Sample9View: View {
    @State var minuteWeathers: [MinuteWeather] = []

    var body: some View {
        VStack {
            ForEach(minuteWeathers, id: \.self.date) { weather in
                Sample8Cell(title: weather.date.description, value: weather.precipitation.description)
            }
        }
        .navigationTitle(Text("MinuteWeather"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 35.467081,
                longitude: 139.620798
            )
            do {
                let forecast = try await service.weather(for: location, including: .minute)
                minuteWeathers = forecast?.forecast ?? []
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample9View_Previews: PreviewProvider {
    static var previews: some View {
        Sample9View()
    }
}
