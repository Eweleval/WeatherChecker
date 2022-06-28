//
//  ForecastResource.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

protocol ForecastWeatherProtocol{
    func getForecastWeatherData(completion: @escaping(Result<ForecastWeatherModel, UserError>) -> Void)
}

struct ForecastWeatherResource: ForecastWeatherProtocol {
    private var httpUtility: UtilityService
    private var urlString: String
    
    init(httpUtility: UtilityService = HTTPUtility(),
         urlString: String){
        self.httpUtility = httpUtility
        self.urlString = urlString
    }
    
    func getForecastWeatherData(completion: @escaping(Result<ForecastWeatherModel, UserError>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        
        httpUtility.performDataTask(url: url, resultType: ForecastWeatherModel.self) { result in
            switch result {
            case .success(let jsonData):
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
