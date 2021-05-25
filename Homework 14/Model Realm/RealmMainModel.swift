//
//  MainModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmMainModel: Object, Codable {
    
    
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var feels_like: Double = 0.0
    @objc dynamic var temp_min: Double = 0.0
    @objc dynamic var temp_max: Double = 0.0
    @objc dynamic var pressure: Int = 0
//    @objc dynamic var sea_level: Int?
//    @objc dynamic var grnd_level: Int?
    @objc dynamic var humidity: Int = 0
//    @objc dynamic var temp_kf: Int?
    
    convenience init(data: MainModel) {
        self.init()
        guard let mTemp = data.temp,
              let mFeels_like = data.feels_like,
              let mTemp_min = data.temp_min,
              let mTemp_max = data.temp_max,
              let mPressure = data.pressure,
              let mHumidity = data.humidity
        else{return}
        self.temp = mTemp
        self.feels_like = mFeels_like
        self.temp_min = mTemp_min
        self.temp_max = mTemp_max
        self.pressure = mPressure
        self.humidity = mHumidity
    }
    
//    override static func primaryKey() -> String? {
//        return "MainModel"
//      }
    
}
