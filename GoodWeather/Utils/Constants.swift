//
//  Constants.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL? {
            let userDefaults = UserDefaults.standard
            guard let unit = userDefaults.value(forKey: "unit") as? String else { return nil }
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=d1917a604322a9987eb8b70c407fed5d&units=\(unit)")
        }
    }
}
