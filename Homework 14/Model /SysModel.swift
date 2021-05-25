//
//  SysModel.swift
//  WeatherApp_Arutyunov
//
//  Created by  Bagrat Arutyunov on 18.12.2020.
//

import Foundation

class SysModel: Codable {
    enum CodingKeys: String, CodingKey {
        case pod = "pod"
    }
    
    var pod: String?
    
}
