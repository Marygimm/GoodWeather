//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
