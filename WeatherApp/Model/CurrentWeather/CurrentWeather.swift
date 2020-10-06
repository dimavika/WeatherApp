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
    let weather: [Weather]
    var tempStr: String {
        return String(format: "%.0f", main.temp)
    }
    var feelsLikeTempStr: String {
        return String(format: "%.0f", main.feelsLike)
    }
    var weatherIconStr: String {
        switch weather.first!.id {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "smoke.fill"
        case 800:
            return "sun.min.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "nosign"
        }
    }
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
