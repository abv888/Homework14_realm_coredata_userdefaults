//
//  WindModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmWindModel: Object, Codable {
    
    
    @objc dynamic var speed: Double = 0.0
    @objc dynamic var deg: Int = 0
    
    convenience init(data: WindModel) {
        self.init()
        guard let mSpeed = data.speed,
              let mDeg = data.deg
        else {return}
        self.speed = mSpeed
        self.deg = mDeg
    }
    
//    override static func primaryKey() -> String? {
//        return "WindModel"
//      }
}
