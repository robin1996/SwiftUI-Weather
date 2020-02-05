//
//  Weather.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import Foundation

struct WeatherDay: Codable {
    let hourly: dataWrapped<[WeatherHour]>
}

struct WeatherHour: Codable {
    let precipProbability, cloudCover: Double
}

struct dataWrapped<T: Codable>: Codable {
    let data: T
}
