//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation
import UIKit


class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(viewModel: WeatherViewModel) {
        cityNameLabel.text = viewModel.city
        temperatureLabel.text = viewModel.temperature.formatAsDegree()
    }
}
