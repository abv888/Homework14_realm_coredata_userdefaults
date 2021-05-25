//
//  WeatherUserDefaultsPersistance.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 24.02.2021.
//

import Foundation


struct UDWeatherKeys {
    
    static let dateKey = "WeatherUserDefaultsPersistance.dateKey"
    static let currTempKey = "WeatherUserDefaultsPersistance.currTempKey"
    static let descriptionImageKey = "WeatherUserDefaultsPersistance.descriptionImageKey"
    static let countKey = "WeatherUserDefaultsPersistance.countKey"
    static let cityNameKey = "WeatherUserDefaultsPersistance.cityNameKey"
    
}


class WeatherUserDefaultsPersistance {
    
    static let shared = WeatherUserDefaultsPersistance()
    
    
    
    var dtUD: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: UDWeatherKeys.dateKey)
        }
        get {
            return UserDefaults.standard.string(forKey: UDWeatherKeys.dateKey)
        }
        
    }
    
    
    var tempUD: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: UDWeatherKeys.currTempKey)
        }
        get {
            return UserDefaults.standard.string(forKey: UDWeatherKeys.currTempKey)
        }
        
    }
    
    var listCountUD: Int? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: UDWeatherKeys.countKey)
        }
        get {
            return UserDefaults.standard.integer(forKey: UDWeatherKeys.countKey)
        }
    }
    
    var cityNameUD: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: UDWeatherKeys.cityNameKey)
        }
        get {
            return UserDefaults.standard.string(forKey: UDWeatherKeys.cityNameKey)
        }
    }
    
    
    var descrUD: URL? {
        set {
            UserDefaults.standard.set(newValue, forKey: UDWeatherKeys.descriptionImageKey)
        }
        get {
            return UserDefaults.standard.url(forKey: UDWeatherKeys.descriptionImageKey)
        }

    }
    

}
