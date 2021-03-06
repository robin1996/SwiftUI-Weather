//
//  DarkSkyController.swift
//  Simple Weather
//
//  Created by Robin Douglas on 05/02/2020.
//  Copyright © 2020 Robin Douglas. All rights reserved.
//

import Foundation
import Combine

class DarkSkyController: ObservableObject {

    var weatherView: WeatherDayViewModel? {
        guard weatherDayViews.count > time.rawValue else { return nil }
        return weatherDayViews[time.rawValue]
    }
    @Published private var weatherDayViews: WeatherDayViewModels = []
    @Published var time = TimeDisplayed.am
    var cancellable: AnyCancellable?

    func getWeather(
        forLat lat: String = "1.5491",
        long: String = "53.8008",
        time: Int = Int(NSDate().timeIntervalSince1970)
    ) {
        cancellable = URLSession.shared
            .dataTaskPublisher(for: URL(
                string: "https://api.darksky.net/forecast/943e8e2cdb0aa4becaf4f37c87c0fd7b/\(long),\(lat),\(time)"
            )!)
            .map { $0.data }
            .decode(type: WeatherDay.self, decoder: JSONDecoder())
            .map(WeatherDayViewModels.init)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                if case .failure(let error) = completion {
                    print("😤 ", error)
                }
            }) { [weak self] vms in
                self?.weatherDayViews = vms
            }
    }

}
