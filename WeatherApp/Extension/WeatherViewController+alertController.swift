//
//  WeatherViewController+alertController.swift
//  WeatherApp
//
//  Created by Димас on 04.10.2020.
//

import UIKit
import CoreLocation

extension WeatherViewController {
    func presentSearchAlert(title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField {tf in
            let cities = ["Los Angeles", "Minsk", "Kyiv"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Seatch", style: .default) { action in
            let tf = ac.textFields?.first
            guard let city = tf?.text else { return }
            if city != "" {
                let cityName = city.split(separator: " ").joined(separator: "%20")
                completionHandler(cityName)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
