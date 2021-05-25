//
//  ListModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class ListModel: Codable {
    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case wind = "wind"
        case dt_txt = "dt_txt"
    }
    
    var dt: Double?
    var main: MainModel?
    var weather: [WeatherModel]?
//    var clouds: CloudsModel?
    var wind: WindModel?
//    var visibility: Int?
//    var pop: Float?
//    var sys:SysModel?
//    var snow: SnowModel?
    var dt_txt: String?
    
}
