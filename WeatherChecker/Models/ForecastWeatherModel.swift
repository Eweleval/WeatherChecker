//
//  ForecastWeatherModel.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

// MARK: - ForecastWeatherModel
struct ForecastWeatherModel: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let main: MainClass
    let weather: [Weather]
    let date: String

    enum CodingKeys: String, CodingKey {
        case  main, weather
        case date = "dt_txt"
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let main: MainEnum

    enum CodingKeys: String, CodingKey {
        case main
    }
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
}

