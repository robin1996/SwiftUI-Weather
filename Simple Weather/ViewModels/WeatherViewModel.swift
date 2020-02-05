//
//  WeatherViewModel.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import SwiftUI

typealias WeatherViewModel = [Color]

extension WeatherViewModel {

    init(_ model: WeatherDay) {
        self = model.hourly.data.prefix(24).map { weather in
            var color = Color.blue
            if weather.precipProbability < 0.3 {
                switch weather.cloudCover {
                case ...0.1:
                    color = .yellow
                case ...0.4:
                    color = Color(.lightGray)
                case ...0.7:
                    color = Color(.gray)
                default:
                    color = Color(.darkGray)
                }
            }
            return color
        }
    }

}
