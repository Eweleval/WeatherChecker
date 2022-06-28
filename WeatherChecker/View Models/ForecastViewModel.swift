//
//  ForecastViewModel.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

protocol ForecastDataDelegate: AnyObject {
    func receiveData(_ data: ForecastWeatherModel)
}

class ForecastWeatherViewModel {
    
    weak var delegate: ForecastDataDelegate?
    
    private let urlString: String = "\(Link.forecastLink)\(Cities.location)\(API.id)\(API.lock)\(Units.id)\(Units.celcius)"
    
    public lazy var forecastWeatherResource: ForecastWeatherProtocol = ForecastWeatherResource(urlString: urlString)
    private var forecastWeather: ForecastWeatherModel?
    
    func receiveData() {
        forecastWeatherResource.getForecastWeatherData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.delegate?.receiveData(listOf)
            case .failure(let error):
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
    }
}
