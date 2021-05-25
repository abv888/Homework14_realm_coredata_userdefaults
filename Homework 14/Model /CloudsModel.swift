//
//  CloudsModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class CloudsModel: Codable {
    enum CodingKeys: String, CodingKey {
        case all = "all"
        
    }
    
    var all: Int?
    
}
