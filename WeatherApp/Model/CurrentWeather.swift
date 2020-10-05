//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Димас on 05.10.2020.
//

import Foundation

struct CurrentWeather: Codable {
    let name: String
    let main: Main
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}
