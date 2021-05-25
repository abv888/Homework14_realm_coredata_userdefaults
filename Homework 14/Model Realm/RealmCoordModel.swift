//
//  CoordModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmCoordModel: Object, Codable {
    
    
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var lon: Double = 0.0
    
    convenience init(data: CoordModel) {
        self.init()
        guard let mLat = data.lat,
              let mLon = data.lon
        else { return }
        self.lat = mLat
        self.lon = mLon
    }
    
    
//    override static func primaryKey() -> String? {
//        return "CoordModel"
//      }
}
