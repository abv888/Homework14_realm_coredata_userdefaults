//
//  WindModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class WindModel: Codable {
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
       
    }
    
    var speed: Double?
    var deg: Int?
    
}
