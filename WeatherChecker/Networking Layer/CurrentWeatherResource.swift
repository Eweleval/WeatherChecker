//
//  CurrentWeatherResource.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation

protocol CurrentWeatherProtocol{
    func getCurrentWeatherData(completion: @escaping(Result<CurrentWeatherModel, UserError>) -> Void)
}

struct CurrentWeatherResource: CurrentWeatherProtocol {
    private var httpUtility: UtilityService
    private var urlString: String
    
    init(httpUtility: UtilityService = HTTPUtility(),
         urlString: String){
        self.httpUtility = httpUtility
        self.urlString = urlString
    }
    
    func getCurrentWeatherData(completion: @escaping(Result<CurrentWeatherModel, UserError>) -> Void){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.InvalidURL))
            return
        }
        
        httpUtility.performDataTask(url: url, resultType: CurrentWeatherModel.self) { result in
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
