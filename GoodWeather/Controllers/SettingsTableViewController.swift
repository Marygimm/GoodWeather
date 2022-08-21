//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Mary Moreira on 21/08/2022.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}


class SettingsTableViewController: UITableViewController {
    
    var delegate: SettingsDelegate?
    
    private var settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func done() {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: settingsViewModel)
        }
        self.dismiss(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        let settingsItem = settingsViewModel.units[indexPath.row]
        cell.textLabel?.text = settingsItem.displayName
        
        if settingsItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncheck all cells
        
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
