//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Barış Can Akkaya on 12.06.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityName: UITextField!
    var weatherViewModel: WeatherViewModel? = nil
    var url: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
    }
}


//MARK: - ViewController

extension WeatherViewController {
    @IBAction func findTemp(_ sender: UIButton) {
        cityName.endEditing(true)
    }
    
    func getURL(cityName: String?) -> String {
        if let cityName = cityName {
            let url = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=a09ee526355bc421b09df90fe76ee86c&units=metric"
            return url
        }
        return "Error"
    }
}



//MARK: - TextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @objc func hideKeyboard() {
        cityName.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityName.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if cityName.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter a city name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        url = getURL(cityName: cityName.text)
        if let url = url {
            WeatherRequest().getResponse(url: url) { weathermodel in
                if let weathermodel = weathermodel {
                    self.weatherViewModel = WeatherViewModel(weatherModel: weathermodel)
                    DispatchQueue.main.async {
                        self.weatherViewModel = WeatherViewModel(weatherModel: weathermodel)
                        if let weatherViewModel = self.weatherViewModel {
                            self.cityLabel.text = "City: \(weatherViewModel.city)"
                            self.windSpeed.text = "Wind Speed: \(weatherViewModel.windSpeed)"
                            self.temperature.text = "Temperature: \(weatherViewModel.temperature)"
                            self.weatherDescription.text = "Weather Description: \(weatherViewModel.description)"
                        }
                    }
                }
            }
        }
        
        cityName.text = ""
    }
    
}
