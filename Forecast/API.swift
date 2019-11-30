//
//  API.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/24/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//


private let baseUrlForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appid = "c93c3e547c7f296cf0aba6d39c272c24"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

import SwiftUI

class API {
    class func fetchCurrrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void ){
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial"]

        guard let url = baseUrlForCurrentWeather.withQueries(query) else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }

    class func weeklyWeather(by city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial", "cnt": "7"]
        guard baseUrlForWeeklyWeather.withQueries(query) != nil else { fatalError("Invalid URL for weekly weather")}
        guard let url = baseUrlForWeeklyWeather.withQueries(query) else { fatalError() }
        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }

            do {
                let weather = try decoder.decode(WeeklyWeather.self, from:data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
