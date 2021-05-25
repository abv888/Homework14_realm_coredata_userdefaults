//
//  WeatherModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmWeatherModel: Object, Codable {
    
    
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String = ""
    @objc dynamic var descriptionWeather : String = ""
    @objc dynamic var icon: String = ""
    
//    convenience init(data: WeatherModel) {
//        self.init()
//        guard let mId = data.id,
//              let mMain = data.main,
//              let mDescriptionWeather = data.description,
//              let mIcon = data.icon
//        else{return}
//        self.id = mId
//        self.main = mMain
//        self.descriptionWeather = mDescriptionWeather
//        self.icon = mIcon
//    }
    
//    override static func primaryKey() -> String? {
//        return "WeatherModel"
//      }
    
}
