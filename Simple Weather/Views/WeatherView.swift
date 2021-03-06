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
    var diameter: CGFloat {
        min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.9
    }
    var c: CGFloat {
        .pi * diameter
    }
    var r: CGFloat {
        diameter / 2
    }
    var numberOfSegments: Int {
        controller.weatherView?.weatherView.count ?? 0
    }
    var segmentWidth: CGFloat {
        c / CGFloat(numberOfSegments) * 0.8
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<numberOfSegments, id: \.self) { hour in
                    ZStack {
                        Circle()
                            .fill(self.colorFor(segment: hour))
                        Text(hour.description)
                            .foregroundColor(self.textColourFor(segment: hour))
                    }
                        .frame(
                            width: self.segmentWidth,
                            height: self.segmentWidth,
                            alignment: .center
                        )
                        .offset(
                            x: self.r * CGFloat(sin(self.angleFor(segment: hour))),
                            y: self.r * CGFloat(cos(self.angleFor(segment: hour)))
                        )
                }
            }
                .frame(width: diameter * 1.1, height: diameter * 1.1, alignment: .center)
            Spacer()
            Button("Network", action: refreshWeather)
            Button("PM", action: setPM)
            Spacer()
        }
    }

    func angleFor(segment: Int) -> Double {
        2 * .pi * Double(segment) / Double(numberOfSegments)
    }

    func colorFor(segment: Int) -> Color {
        controller.weatherView!.weatherView[segment]
    }

    func textColourFor(segment: Int) -> Color {
        let fill = colorFor(segment: segment)
        return fill == Color(.darkGray) ? .white : .black
    }

}

extension WeatherView {

    func refreshWeather() {
        controller.getWeather()
    }
    
    func setPM() {
        controller.time = .pm
    }

}
