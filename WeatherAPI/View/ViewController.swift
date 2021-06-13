//
//  ViewController.swift
//  WeatherAPI
//
//  Created by Barış Can Akkaya on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityName: UITextField!
    //var weatherViewModel: WeatherViewModel? = nil
    //let url: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesture)
    }
}


//MARK: - ViewController

extension ViewController {
    @IBAction func findTemp(_ sender: UIButton) {
        
    }
    
    func getURL(cityName: String?) -> String {
        if let cityName = cityName {
            let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=a09ee526355bc421b09df90fe76ee86c&units=metric"
            return url
        }
        return "Error"
    }
}



//MARK: - TextFieldDelegate

extension ViewController: UITextFieldDelegate {
    @objc func hideKeyboard() {
        cityName.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("11")
    }
    
}
