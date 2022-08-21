//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String{
        return String(format: "%.0f°",self)
    }
}
