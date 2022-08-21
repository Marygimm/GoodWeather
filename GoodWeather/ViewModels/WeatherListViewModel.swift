//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

class WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherViewModel = vm
            weatherViewModel.temperature = (weatherViewModel.temperature - 32) * 5/9
            return weatherViewModel
        }
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherViewModel = vm
            weatherViewModel.temperature = (weatherViewModel.temperature * 9/5) + 32
            return weatherViewModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}


class WeatherViewModel {
    
    let weather: WeatherResponse
    
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main?.temp ?? 0.0
    }
    
    var city: String {
        return weather.name ?? ""
    }
}
