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
    @State var currentWeather: CurrentWeather?

    var body: some View {
        List {
            Group {
                Sample8Cell(title: "体感温度", value: String(currentWeather?.apparentTemperature.value ?? 0.0) + "℃")
                Sample8Cell(title: "雲量（割合）", value: String(currentWeather?.cloudCover ?? 0.0))
                Sample8Cell(title: "天気", value: String(currentWeather?.condition.description ?? ""))
                Sample8Cell(title: "露点", value: String(currentWeather?.dewPoint.value ?? 0.0) + "℃")
                Sample8Cell(title: "湿度（割合）", value: String(currentWeather?.humidity ?? 0.0))
                Sample8Cell(title: "気圧", value: String(currentWeather?.pressure.value ?? 0.0) + "mbar")
                Sample8Cell(title: "気圧傾向", value: String(currentWeather?.pressureTrend.description ?? ""))
                Sample8Cell(title: "温度", value: String(currentWeather?.temperature.value ?? 0.0) + "℃")
                Sample8Cell(title: "紫外線強度", value: String(currentWeather?.uvIndex.value ?? 0))
                Sample8Cell(title: "視認度", value: String(currentWeather?.visibility.value ?? 0.0) + "m")
            }
            Sample8Cell(title: "風向", value: String(currentWeather?.wind.direction.value ?? 0.0) + "°")
            Sample8Cell(title: "風速", value: String(currentWeather?.wind.speed.value ?? 0.0) + "km/h")
            Sample8Cell(title: "突風", value: String(currentWeather?.wind.gust?.value ?? 0.0) + "km/h")
        }
        .navigationTitle(Text("CurrentWeather"))
        .task {
            let service = WeatherService()
            let location = CLLocation(
                latitude: 35.467081,
                longitude: 139.620798
            )
            do {
                let weather = try await service.weather(for: location)
                currentWeather = weather.currentWeather
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

struct Sample8View_Previews: PreviewProvider {
    static var previews: some View {
        Sample8View()
    }
}
