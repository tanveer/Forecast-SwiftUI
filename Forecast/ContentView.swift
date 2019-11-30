//
//  ContentView.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/24/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()

    var body: some View {
        VStack{
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.75).animation(.easeInOut(duration: 0.5))
                    .modifier(CurrentViewModifier()).animation(.easeInOut(duration: 0.5))
            }
            WeeklyWeatherView(listData: weeklyWeather.weather?.list ?? [], value: selected, height: UIScreen.main.bounds.height * 0.5)
            VStack{
                Picker("", selection: $selected){
                    Text("Today")
                        .tag(0)
                    Text("Week")
                        .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
