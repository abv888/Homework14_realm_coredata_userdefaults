//
//  RequestModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmRequestModel: Object, Codable {
    
    
    @objc dynamic var cod: String = ""
    @objc dynamic var message: Double = 0.0
    @objc dynamic var cnt: Double = 0.0
    var list: List<RealmListModel> = List<RealmListModel>()
    @objc dynamic var city: RealmCityModel?
    
    
    convenience init(data: RealmCityModel, data2: RealmListModel, data3: RequestModel) {
        self.init()
        guard let mCode = data3.cod,
              let mMessage = data3.message
        else {return}
       
    
        self.cod = mCode
        self.message = mMessage
        self.cnt = data3.cnt
        self.list = list
        self.city = city
        
    }
    
    
//    override static func primaryKey() -> String? {
//        return "cod"
//      }
}
