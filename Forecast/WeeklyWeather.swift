//
//  WeeklyWeather.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/29/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation

struct WeeklyWeather: Codable {
    let list: [ListData]
    let city: CityObject
}

struct ListData: Codable, Identifiable {
    let id = UUID()
    let sunrise: Int
    let sunset: Int
    let dt: Int
    let temp: TempObject
    let weather: [WeatherObject]
    let clouds: Double
    let pressure: Int
    let humidity: Int
}

struct TempObject: Codable {
    let day, min, max, night, eve, morn: Double
}

struct WeatherObject: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CityObject: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let timezone: Int
    let population: Int
}
