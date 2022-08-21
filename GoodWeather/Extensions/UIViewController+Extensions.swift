//
//  UIViewController+Extensions.swift
//  GoodWeather
//
//  Created by Mary Moreira on 21/08/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showMessage(withTitle title: String, messagem: String) {
        let alert = UIAlertController(title: title, message: messagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
