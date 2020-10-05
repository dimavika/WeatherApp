//
//  WeatherApiService.swift
//  WeatherApp
//
//  Created by Димас on 04.10.2020.
//

import Foundation
import Alamofire

class WeatherApiService {
    static let shared = WeatherApiService()
    var onComplition: ((CurrentWeather) -> Void)?
    
    private init() {}
    
    private let apiKey = "5b7e78fae5d9a792f58b060da812fa16"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchCurrentWeather(forCity city: String) {
        let fullURL = baseURL + "?q=\(city)&appid=\(apiKey)"
        let url = URL(string: fullURL)!
        let dataRequest = AF.request(url)
        dataRequest.responseDecodable(of: CurrentWeather.self) { res in
            if let currWeather = res.value {
                self.onComplition?(currWeather)
            }
        }
        
    }
}
