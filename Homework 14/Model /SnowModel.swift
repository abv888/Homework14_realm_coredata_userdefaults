//
//  SnowModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class SnowModel: Codable {
    enum CodingKeys: String, CodingKey {
        case the3h = "the3h"
    }
    
    var the3h: Double?
    
}
