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
                guard weatherViewModel.weather.main != nil else {
                    self.showAlert()
                    return }
                self.delegate?.addWeatherDidSave(vm: weatherViewModel)
                self.dismiss(animated: true)
            }
        }
    }
    
    private func clearData() {
        cityNameTextField.text = nil
    }
    
    private func showAlert() {
        clearData()
        self.showMessage(withTitle: "Error!", messagem: "City not found. Try Again :)")
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
