//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Barış Can Akkaya on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://api.openweathermap.org/data/2.5/weather?q=istanbul&appid=a09ee526355bc421b09df90fe76ee86c&units=metric"
        WeatherRequest().getResponse(url: url) { weatherModel in
            if let model = weatherModel {
                DispatchQueue.main.async {
                    print(model.main.temp)
                }
            }
        }
    }
    
    
}

