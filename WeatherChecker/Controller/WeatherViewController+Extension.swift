//
//  WeatherViewController+Extension.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import Foundation
import UIKit

extension WeatherViewController: CurrentDataDelegate, ForecastDataDelegate {
    func receiveData(_ data: CurrentWeatherModel) {
        self.currentData = data
    }
    
    func receiveData(_ data: ForecastWeatherModel) {
        self.forecastData = data

        dayOne.text = DateFormatting.shared.convertDate(forecastData?.list[1].date)
        dayTwo.text = DateFormatting.shared.convertDate(forecastData?.list[9].date)
        dayThree.text = DateFormatting.shared.convertDate(forecastData?.list[17].date)
        dayFour.text = DateFormatting.shared.convertDate(forecastData?.list[25].date)
        dayFive.text = DateFormatting.shared.convertDate(forecastData?.list[33].date)

        dayOneTemp.text = "\(Int(forecastData?.list[1].main.temp ?? 0.0))°"
        dayTwoTemp.text = "\(Int(forecastData?.list[9].main.temp ?? 0.0))°"
        dayThreeTemp.text = "\(Int(forecastData?.list[17].main.temp ?? 0.0))°"
        dayFourTemp.text = "\(Int(forecastData?.list[25].main.temp ?? 0.0))°"
        dayFiveTemp.text = "\(Int(forecastData?.list[33].main.temp ?? 0.0))°"
        
        switch forecastData?.list[1].weather[0].main {
        case .some(.clouds):
            dayOneCondition.image = UIImage(named: "PartlySunny")
        case .none:
            dayOneCondition.image = UIImage(named: "Clear")
        case .some(.rain):
            dayOneCondition.image = UIImage(named: "Rain")
        case .some(.clear):
            dayOneCondition.image = UIImage(named: "Clear")
        }

        switch forecastData?.list[9].weather[0].main {
        case .some(.clouds):
            dayTwoCondition.image = UIImage(named: "PartlySunny")
        case .none:
            dayTwoCondition.image = UIImage(named: "Clear")
        case .some(.rain):
            dayTwoCondition.image = UIImage(named: "Rain")
        case .some(.clear):
            dayTwoCondition.image = UIImage(named: "Clear")
        }

        switch forecastData?.list[17].weather[0].main {
        case .some(.clouds):
            dayThreeCondition.image = UIImage(named: "PartlySunny")
        case .none:
            dayThreeCondition.image = UIImage(named: "Clear")
        case .some(.rain):
            dayThreeCondition.image = UIImage(named: "Rain")
        case .some(.clear):
            dayThreeCondition.image = UIImage(named: "Clear")
        }

        switch forecastData?.list[25].weather[0].main {
        case .some(.clouds):
            dayFourCondition.image = UIImage(named: "PartlySunny")
        case .none:
            dayFourCondition.image = UIImage(named: "Clear")
        case .some(.rain):
            dayFourCondition.image = UIImage(named: "Rain")
        case .some(.clear):
            dayFourCondition.image = UIImage(named: "Clear")
        }

        switch forecastData?.list[33].weather[0].main {
        case .some(.clouds):
            dayFiveCondition.image = UIImage(named: "PartlySunny")
        case .none:
            dayFiveCondition.image = UIImage(named: "Clear")
        case .some(.rain):
            dayFiveCondition.image = UIImage(named: "Rain")
        case .some(.clear):
            dayFiveCondition.image = UIImage(named: "Clear")
        }
    }
}
