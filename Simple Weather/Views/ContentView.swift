//
//  ContentView.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import SwiftUI

struct WeatherView: View {

    @ObservedObject var controller = DarkSkyController()

    var body: some View {
        VStack {
            Text(controller.weatherView?.timeZone ?? "test")
            Button("Network", action: refreshWeather)
        }
    }

}

extension WeatherView {

    func refreshWeather() {
        controller.getWeather()
    }

}
