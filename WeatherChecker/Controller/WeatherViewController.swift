//
//  WeatherViewController.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: - Properities
    let forecastModel = ForecastWeatherViewModel()
    let currentModel = CurrentWeatherViewModel()
    var forecastData: ForecastWeatherModel?
    var currentData: CurrentWeatherModel?

    // MARK: - CurrentWeather Outlets
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var minimumTemp: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var maximumTemp: UILabel!

    // MARK: - Forecast Outlets
    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var dayFour: UILabel!
    @IBOutlet weak var dayFive: UILabel!
    @IBOutlet weak var dayOneTemp: UILabel!
    @IBOutlet weak var dayTwoTemp: UILabel!
    @IBOutlet weak var dayThreeTemp: UILabel!
    @IBOutlet weak var dayFourTemp: UILabel!
    @IBOutlet weak var dayFiveTemp: UILabel!
    @IBOutlet weak var dayOneCondition: UIImageView!
    @IBOutlet weak var dayTwoCondition: UIImageView!
    @IBOutlet weak var dayThreeCondition: UIImageView!
    @IBOutlet weak var dayFourCondition: UIImageView!
    @IBOutlet weak var dayFiveCondition: UIImageView!
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentModel.delegate = self
        currentModel.receiveData()
        forecastModel.delegate = self
        forecastModel.receiveData()
        searchField.delegate = self
    }


}

