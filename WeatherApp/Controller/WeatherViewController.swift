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
    let locationService = LocationService()
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.getDataByCity()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataByLocation()
    }
}

extension WeatherViewController {
    
    func getDataByLocation() {
        locationService.locationManager.requestLocation()
        let urlString = weatherApiBaseURL + "?lat=\(locationService.currLatitude)&lon=\(locationService.currLongitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        self.weatherApiService.fetchData(forURL: url)
        self.weatherApiService.onComplition = { currWeather in
            self.updateInterface(currWeather: currWeather)
        }
    }
    
    func getDataByCity() {
        self.presentSearchAlert(title: "Enter city", message: nil, style: .alert) { city in
            let urlString = weatherApiBaseURL + "?q=\(city)&appid=\(apiKey)&units=metric"
            guard let url = URL(string: urlString) else { return }
            self.weatherApiService.fetchData(forURL: url)
            self.weatherApiService.onComplition = { currWeather in
                self.updateInterface(currWeather: currWeather)
            }
        }
    }
    
    func updateInterface(currWeather: CurrentWeather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = currWeather.tempStr
            self.feelsLikeLabel.text = currWeather.feelsLikeTempStr
            self.cityLabel.text = currWeather.name
            self.weatherIconImageView.image = UIImage(systemName: currWeather.weatherIconStr)
        }
    }
}

