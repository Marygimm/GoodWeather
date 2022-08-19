//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        let temperatureInCelsius = self - 273.15
        return String(format: "%.0fº", temperatureInCelsius)
    }
}
