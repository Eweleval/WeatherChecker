//
//  Styling.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import UIKit

enum Styling {
    case rainy
    case cloudy
    case sunny
    case others
    //MARK: - Style code for color
    var color: UIColor {
        switch self {
        case .rainy:
            return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1)
        case .cloudy:
            return UIColor(red: 0.38, green: 0.52, blue: 0.58, alpha: 1)
        case .sunny:
            return UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1)
        case .others:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1)
        }
    }
    //MARK: - Style code for images according to the weather description
    var weatherImage: UIImage {
        switch self {
        case .rainy:
            return UIImage(named: "Rainy") ?? UIImage()
        case .cloudy:
            return UIImage(named: "Cloudy") ?? UIImage()
        case .sunny:
            return UIImage(named: "Sunny") ?? UIImage()
        case .others:
            return UIImage(named: "default") ?? UIImage()
        }
    }
    //MARK: - Style code for icons according to weather description
    var forecastIcon: UIImage {
        switch self{
        case .rainy:
            return UIImage(named: "Rain") ?? UIImage()
        case .cloudy:
            return UIImage(named: "PartlySunny") ?? UIImage()
        case .sunny:
            return UIImage(named: "Clear") ?? UIImage()
        case .others:
            return UIImage(named: "Clear") ?? UIImage()
        }
    }
}

extension UIButton {
    func makeCircular() {
        self.setTitle("", for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
    }
}
