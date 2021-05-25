//
//  CityModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class CityModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "lat"
        case name = "lon"
        case country = "country"
        case population = "population"
    }
    
    var id: Double?
    var name: String?
//    var coord: CoordModel?
    var country: String?
    var population: Double?
//    var timezone: Int?
//    var sunrise: Int?
//    var sunset: Int?
    
}
