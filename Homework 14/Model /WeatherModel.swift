//
//  WeatherModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class WeatherModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    
    var id: Int?
    var main: String?
    var description : String?
    var icon: String?
    
}
