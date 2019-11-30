//
//  CurrentWeather.swift
//  Forecast
//
//  Created by Tanveer Bashir on 11/26/19.
//  Copyright © 2019 Tanveer Bashir. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?

    var height: CGFloat = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today in \(weather?.name ?? "Unkown")")
            .font(.title)
            .foregroundColor(.white)
            .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size: 65))
            }
            Text("\(weather?.weather.last?.description ?? "Unkown")")
                .foregroundColor(.white)
                .font(.body)
            Text("\(weather?.main.tempMax.round ?? 0)")
                .foregroundColor(.white)
                .font(.body)
        }.frame(width: height, height: height)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CurrentViewModifier: ViewModifier {
    private var radius: CGFloat = 20
    private var yAxis: CGFloat = 20
    private var xAxis: CGFloat = 20

    func body(content: Content) -> some View {
        content
        .cornerRadius(20)
        .shadow(color: Color.gray, radius: radius, x: 0, y: yAxis)
        .opacity(0.8)
    }
}

