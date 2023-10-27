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
        NavigationStack {
            List {
                Group {
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
                    NavigationLink {
                        Sample8View()
                    } label: {
                        Text("CurrentWeather")
                    }
                    NavigationLink {
                        Sample9View()
                    } label: {
                        Text("MinuteWeather")
                    }
                    NavigationLink {
                        Sample10View()
                    } label: {
                        Text("HourWeather")
                    }
                }
                Group {
                    NavigationLink {
                        Sample11View()
                    } label: {
                        Text("DayWeather")
                    }
                    NavigationLink {
                        Sample12View()
                    } label: {
                        Text("WeatherAttribution")
                    }
                    NavigationLink {
                        Sample13View()
                    } label: {
                        Text("WeatherAvailability")
                    }
                    NavigationLink {
                        Sample14View()
                    } label: {
                        Text("WeatherAlert")
                    }
                    NavigationLink {
                        Sample15View()
                    } label: {
                        Text("Sample15")
                    }
                    NavigationLink {
                        Sample16View()
                    } label: {
                        Text("Sample16")
                    }
                    NavigationLink {
                        Sample17View()
                    } label: {
                        Text("Sample17")
                    }
                    NavigationLink {
                        Sample18View()
                    } label: {
                        Text("Sample18")
                    }
                    NavigationLink {
                        Sample19View()
                    } label: {
                        Text("Sample19")
                    }
                    NavigationLink {
                        Sample20View()
                    } label: {
                        Text("Sample20")
                    }
                }
                Group {
                    NavigationLink {
                        Sample21View()
                    } label: {
                        Text("Sample21")
                    }
                    NavigationLink {
                        Sample22View()
                    } label: {
                        Text("Sample22")
                    }
                    NavigationLink {
                        Sample23View()
                    } label: {
                        Text("Sample23")
                    }
                    NavigationLink {
                        Sample24View()
                    } label: {
                        Text("Sample24")
                    }
                    NavigationLink {
                        Sample25View()
                    } label: {
                        Text("Sample25")
                    }
                    NavigationLink {
                        Sample26View()
                    } label: {
                        Text("Sample26")
                    }
                    NavigationLink {
                        Sample27View()
                    } label: {
                        Text("Sample27")
                    }
                    NavigationLink {
                        SampleMazeView()
                    } label: {
                        Text("Sample Maze")
                    }
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
