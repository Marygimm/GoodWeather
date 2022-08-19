//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String?
    let main: Weather?
}


struct Weather: Decodable {
    let temp: Double?
    let humidity: Int?
}
