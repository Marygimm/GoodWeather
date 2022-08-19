//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        guard let weatherURL = Constants.Urls.urlForWeatherByCity(city: city) else { return }
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
          let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { (result) in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }

}
