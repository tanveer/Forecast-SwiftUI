//
//  WeeklyWeatherView.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/29/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var listData: [ListData] = [ListData]()
    var value: Int = 0
    var height: CGFloat

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(listData) { list in
                    CardView(listData: list)
                        .frame(width: 200, height: self.value == 0 ? 0 : self.height * 0.60).animation(.easeInOut(duration: 0.5))
                    .modifier(CardViewModifier())
                }
            }
        }.padding(20)
            .frame(height: self.value == 0 ? 0 : self.height * 0.65).animation(.easeInOut(duration: 0.5))
    }
}

struct CardView: View {
    var listData: ListData
    var body: some View {
        VStack {
            Text("\(dayOfTheWeekFromTimestamp(listData.dt))")
                .font(.title)
                .foregroundColor(.white)
            HStack {
                Text("\(listData.temp.day.round)º")
                    .modifier(LabelModifier())
                Text("\(listData.temp.min.round)")
                    .font(.system(size: 28, weight: .thin, design: .default))
                    .foregroundColor(.white)
            }
            Text(listData.weather.last?.description ?? "Unkown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.orange)
            .cornerRadius(20)
    }
}

struct LabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 28, weight: .medium))
    }
}
