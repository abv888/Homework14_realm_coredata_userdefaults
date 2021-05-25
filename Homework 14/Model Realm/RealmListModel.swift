//
//  ListModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmListModel: Object, Codable {
    
    
    @objc dynamic var dt: Double = 0.0
    @objc dynamic var main: RealmMainModel?
    var weather: List<RealmWeatherModel> = List<RealmWeatherModel>()
//    @objc dynamic var clouds: CloudsModel?
    @objc dynamic var wind: RealmWindModel?
//    @objc dynamic var visibility: Int?
//    @objc dynamic var pop: Float?
//    @objc dynamic var sys:SysModel?
//    @objc dynamic var snow: SnowModel?
    @objc dynamic var dt_txt: String = ""
    
    convenience init(data: ListModel) {
        self.init()
        guard let mDt_txt = data.dt_txt,
              let mDt = data.dt
        else{return}
        
        self.dt_txt = mDt_txt
        self.dt = mDt
        self.main = main
        self.weather = weather
        self.wind = wind

        
        
        
    }
    
    
//    override static func primaryKey() -> String? {
//        return "dt_txt"
//      }
    

    
    
}
