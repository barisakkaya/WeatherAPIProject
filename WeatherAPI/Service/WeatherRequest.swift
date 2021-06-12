//
//  WeatherRequest.swift
//  WeatherAPI
//
//  Created by Barış Can Akkaya on 12.06.2021.
//

import Foundation

class WeatherRequest {
    func getResponse(url: String, completionHandler: @escaping (WeatherModel?) -> ()) {
        let weatherURL = URL(string: url)
        if let weatherURL = weatherURL {
            URLSession.shared.dataTask(with: weatherURL) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    completionHandler(nil)
                } else if let data = data {
                    let parsedJSON = try? JSONDecoder().decode(WeatherModel.self, from: data)
                    if let parsedJSON = parsedJSON {
                        print(parsedJSON.main.temp)
                        completionHandler(parsedJSON)
                    }
                }
            }.resume()
        }
    }
}
