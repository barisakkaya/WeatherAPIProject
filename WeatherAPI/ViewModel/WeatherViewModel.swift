//
//  WeatherViewModel.swift
//  WeatherAPI
//
//  Created by Barış Can Akkaya on 12.06.2021.
//

import Foundation

struct WeatherViewModel {
    let weatherModel: WeatherModel?
}

extension WeatherViewModel {
    init(weatherModel: WeatherModel) {
        self.weatherModel = weatherModel
    }
}
