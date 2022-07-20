//
//  ForecastViewModel.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation
import CoreLocation

protocol ForecastDataDelegate: AnyObject {
    func receiveData(_ data: ForecastWeatherModel)
}

class ForecastWeatherViewModel {
    
    weak var delegate: ForecastDataDelegate?
    
    public var forecastWeatherResource: ForecastWeatherProtocol? 
    private var forecastWeather: ForecastWeatherModel?

    func getCityName(cityName: String) {
        let urlString = "\(Link.forecastLink)\(API.id)\(API.lock)\(Units.id)\(Units.celcius)\(Cities.id)\(cityName)"
        forecastWeatherResource = ForecastWeatherResource(urlString: urlString)
    }

    func getgetLocation(latitude: CLLocationDegrees, longitute: CLLocationDegrees) {
        let urlString = "\(Link.forecastLink)\(API.id)\(API.lock)\(Units.id)\(Units.celcius)\(Cities.id)\(Cities.lat)\(latitude)\(Cities.lon)\(longitute)"
        forecastWeatherResource = ForecastWeatherResource(urlString: urlString)
    }

    func receiveData() {
        forecastWeatherResource?.getForecastWeatherData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.delegate?.receiveData(listOf)
            case .failure(let error):
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
    }
}
