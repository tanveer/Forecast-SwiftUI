//
//  CurrentWeatherViewModel.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/24/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?

    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(_ city: String = "Chicago"){
        API.fetchCurrrentWeather(by: city) {
            self.current = $0
        }
    }
}
