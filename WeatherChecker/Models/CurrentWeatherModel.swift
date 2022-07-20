//
//  CurrentWeatherModel.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

// MARK: - CurrentWeatherModel
struct CurrentWeatherModel: Codable {
    let weather: [CurrentWeather]
    let main: CurrentMain
    let name: String 
    
}

// MARK: - Main
struct CurrentMain: Codable {
    let temp, feelsLike, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Weather
struct CurrentWeather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
