//
//  WeatherDayViewModel.swift
//  Simple Weather
//
//  Created by Robin Douglas on 06/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import Foundation

typealias WeatherDayViewModels = [WeatherDayViewModel]

extension WeatherDayViewModels {
    
    init(_ model: WeatherDay) {
        let hours = model.hourly.data
        self = hours
            .enumerated()
            .split(whereSeparator: { (indexedHour) -> Bool in
                return indexedHour.offset != 0 && indexedHour.offset % 12 == 0
            })
            .map { $0.map { $0.element } }
            .compactMap { WeatherViewModel($0) }
            .prefix(2)
            .enumerated()
            .map { WeatherDayViewModel(
                timeDisplayed: TimeDisplayed(rawValue: $0.offset) ?? .am,
                weatherView: $0.element
            ) }
    }
    
}

enum TimeDisplayed: Int {
    case am
    case pm
}

struct WeatherDayViewModel {
    
    let timeDisplayed: TimeDisplayed
    let weatherView: WeatherViewModel
    
}
