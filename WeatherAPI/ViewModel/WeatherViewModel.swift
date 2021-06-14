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
    
    var description: String {
        if let model = weatherModel{
            return model.weather[0].weatherDescription
        }
        return ""
    }
    
    var windSpeed: String {
        if let model = weatherModel{
            return String(format:"%.1f",model.wind.speed)
        }
        return ""
    }
    
    var city: String {
        if let model = weatherModel {
            return model.name
        }
        return ""
    }
    var temperature: String {
        if let model = weatherModel {
            return String(format:"%.1f",model.main.temp)
        }
        return ""
    }
}
