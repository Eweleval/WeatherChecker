//
//  Common.swift
//  WeatherChecker
//
//  Created by Decagon on 28/06/2022.
//

import UIKit

struct API {
    static let lock: String = "APIKEY GOES HERE"
    static let id: String = "appid="
}

struct Link{
    static let currentLink: String = "https://api.openweathermap.org/data/2.5/weather?"
    static let forecastLink: String = "https://api.openweathermap.org/data/2.5/forecast?"
}

struct Cities {
    static let id: String = "&q="
    static let lat: String = "&lat="
    static let lon: String = "&lon="
    static let location: String = "asaba"
    static let location1: String = "abuja"
    static let location2: String = "calabar"
    static let location3: String = "uyo"
    static let location4: String = "kano"
    static let location5: String = "adamawa"
    static let location6: String = "delta"
    static let location7: String = "london"
    static let location8: String = "china"
    static let location9: String = "germany"
    static let location10: String = "russia"
}

struct Units {
    static let id: String = "&units="
    static let celcius: String = "metric"
    static let fahrenheit: String = "imperial"
}

//MARK: - Date formatting
struct DateFormatting {
    static let shared = DateFormatting()

    func convertDate(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "EEEE"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
}
