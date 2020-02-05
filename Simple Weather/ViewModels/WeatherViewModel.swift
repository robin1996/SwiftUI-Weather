//
//  WeatherViewModel.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import Foundation

struct WeatherViewModel {

    let timeZone: String

    init(_ model: WeatherDay) {
        timeZone = model.timezone
    }

}
