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

        currentTemp.text = "\(Int(currentData?.main.temp ?? 0.0))°"
        condition.text = currentData?.weather[0].main
        minimumTemp.text = "\(Int(currentData?.main.tempMin ?? 0.0))°"
        temperature.text = "\(Int(currentData?.main.temp ?? 0.0))°"
        maximumTemp.text = "\(Int(currentData?.main.tempMax ?? 0.0))°"

        switch currentData?.weather[0].main {
        case "Clouds":
            condition.text = "CLOUDY"
            currentWeatherImage.image = Styling.cloudy.weatherImage
            view.backgroundColor = Styling.cloudy.color
        case "Rain":
            condition.text = "RAINY"
            currentWeatherImage.image = Styling.rainy.weatherImage
            view.backgroundColor = Styling.rainy.color
        case "Clear":
            condition.text = "SUNNY"
            currentWeatherImage.image = Styling.sunny.weatherImage
            view.backgroundColor = Styling.sunny.color
        default: break
        }
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
            dayOneCondition.image = Styling.cloudy.forecastIcon
        case .none:
            dayOneCondition.image = Styling.others.forecastIcon
        case .some(.rain):
            dayOneCondition.image = Styling.rainy.forecastIcon
        case .some(.clear):
            dayOneCondition.image = Styling.sunny.forecastIcon
        }

        switch forecastData?.list[9].weather[0].main {
        case .some(.clouds):
            dayTwoCondition.image = Styling.cloudy.forecastIcon
        case .none:
            dayTwoCondition.image = Styling.others.forecastIcon
        case .some(.rain):
            dayTwoCondition.image = Styling.rainy.forecastIcon
        case .some(.clear):
            dayTwoCondition.image = Styling.sunny.forecastIcon
        }

        switch forecastData?.list[17].weather[0].main {
        case .some(.clouds):
            dayThreeCondition.image = Styling.cloudy.forecastIcon
        case .none:
            dayThreeCondition.image = Styling.others.forecastIcon
        case .some(.rain):
            dayThreeCondition.image = Styling.rainy.forecastIcon
        case .some(.clear):
            dayThreeCondition.image = Styling.sunny.forecastIcon
        }

        switch forecastData?.list[25].weather[0].main {
        case .some(.clouds):
            dayFourCondition.image = Styling.cloudy.forecastIcon
        case .none:
            dayFourCondition.image = Styling.others.forecastIcon
        case .some(.rain):
            dayFourCondition.image = Styling.rainy.forecastIcon
        case .some(.clear):
            dayFourCondition.image = Styling.sunny.forecastIcon
        }

        switch forecastData?.list[33].weather[0].main {
        case .some(.clouds):
            dayFiveCondition.image = Styling.cloudy.forecastIcon
        case .none:
            dayFiveCondition.image = Styling.others.forecastIcon
        case .some(.rain):
            dayFiveCondition.image = Styling.rainy.forecastIcon
        case .some(.clear):
            dayFiveCondition.image = Styling.sunny.forecastIcon
        }
    }
}
