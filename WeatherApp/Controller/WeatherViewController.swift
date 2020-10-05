//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Димас on 01.10.2020.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let weatherApiService = ApiService<CurrentWeather>()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlert(title: "Enter city", message: nil, style: .alert) { city in
            let urlString = weatherApiBaseURL + "?q=\(city)&appid=\(apiKey)&units=metric"
            guard let url = URL(string: urlString) else { return }
            self.weatherApiService.fetchData(forURL: url)
            self.weatherApiService.onComplition = { currWeather in
                self.updateInterface(currWeather: currWeather)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateInterface(currWeather: CurrentWeather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = currWeather.main.temp.rounded().description
            self.feelsLikeLabel.text = currWeather.main.feelsLike.rounded().description
            self.cityLabel.text = currWeather.name
        }
    }
}

