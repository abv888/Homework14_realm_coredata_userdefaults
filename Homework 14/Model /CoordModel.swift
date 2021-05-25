//
//  CoordModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class CoordModel: Codable {
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
    
    var lat: Double?
    var lon: Double?
    
}
