//
//  CurrentWeatherViewModel.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

protocol CurrentDataDelegate: AnyObject{
    func receiveData(_ data: CurrentWeatherModel)
}

class CurrentWeatherViewModel {
    
     weak var delegate: CurrentDataDelegate?
    
    private let urlString: String = "\(Link.currentLink)\(API.id)\(API.lock)\(Units.id)\(Units.celcius)\(Cities.id)\(Cities.location)"
    
    public lazy var currentWeatherResource: CurrentWeatherProtocol = CurrentWeatherResource(urlString: urlString)
    private var currentWeather: CurrentWeatherModel?

    func getCityName(cityName: String) {
        let urlString = "\(Link.currentLink)\(API.id)\(API.lock)\(Units.id)\(Units.celcius)\(Cities.id)\(cityName)"
        currentWeatherResource = CurrentWeatherResource(urlString: urlString)
    }
    
    func receiveData() {
        currentWeatherResource.getCurrentWeatherData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.delegate?.receiveData(listOf)
            case .failure(let error):
                print("Error processing json data: \(error.localizedDescription)")
            }
        }
    }
}
