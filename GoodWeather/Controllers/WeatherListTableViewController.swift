//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Mary Moreira on 19/08/2022.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        let model = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(viewModel: model)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue:segue)
        }
        
        func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation controller not found")
            }
            
            guard let addWeatherCityViewController = nav.viewControllers.first as? AddWeatherCityViewController else {
                fatalError("Navigation controller not found")
            }
            
            addWeatherCityViewController.delegate = self
        }
    }
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        tableView.reloadData()
    }
    
    
}
