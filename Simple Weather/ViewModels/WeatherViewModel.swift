//
//  WeatherViewModel.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import SwiftUI

typealias WeatherViewModel = [Int: Color]

extension WeatherViewModel {

    init(_ model: WeatherDay) {
        var dict: WeatherViewModel = [:]
        let currentHour = Calendar.current.component(.hour, from: Date())
        for (index, hour) in (currentHour...currentHour + 11).enumerated() {
            let weather = model.hourly.data[index]
            var color = Color.blue
            if weather.precipProbability < 0.3 {
                switch weather.cloudCover {
                case ...0.2:
                    color = .yellow
                case ...0.5:
                    color = Color(.lightGray)
                case ...0.75:
                    color = Color(.gray)
                default:
                    color = Color(.darkGray)
                }
            }
            dict[hour % 12] = color
        }
        self = dict
    }

}
