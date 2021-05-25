//
//  MainModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class MainModel: Codable {
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
//    var sea_level: Int?
//    var grnd_level: Int?
    var humidity: Int?
//    var temp_kf: Int?
//    
}
