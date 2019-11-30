//
//  WeeklyWeatherViewModel.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/29/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI
import Combine


class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "new york") {
        API.weeklyWeather(by: city) {
            self.weather = $0
        }
    }
}
