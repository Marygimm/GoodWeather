//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    private var addWeatherViewModel = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed(){
        if let city = cityNameTextField.text {
            addWeatherViewModel.addWeather(for: city) { weatherViewModel in
                self.delegate?.addWeatherDidSave(vm: weatherViewModel)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
