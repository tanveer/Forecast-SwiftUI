//
//  Extension.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/29/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import Foundation


extension Double {
    var round: Int {
        return Int(self)
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            fatalError()
        }
        component.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}

extension DateFormatter {
    convenience init(dateFormat: String){
        self.init()
        self.dateFormat = dateFormat
    }
}

extension Date {
    func dateFromUnixtimestamp(_ timeStamp: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: timeStamp)
    }

    var day: String {
        let dateFormatter = DateFormatter(dateFormat: "EEEE")
        return dateFormatter.string(from: self)
    }

    var time: String {
        let dateFormatter = DateFormatter(dateFormat: "hh a")
        return dateFormatter.string(from: self)
    }
}

func dayOfTheWeekFromTimestamp(_ timestamp: Int) -> String {
    let date = Date().dateFromUnixtimestamp(TimeInterval(timestamp))
    return date.day
}
