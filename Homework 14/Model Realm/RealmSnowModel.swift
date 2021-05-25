//
//  SnowModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmSnowModel: Object, Codable {
    
    
    @objc dynamic var the3h: Double = 0.0
    
    convenience init(data: SnowModel) {
        self.init()
        guard let mThe3h = data.the3h
        else {return}
        self.the3h = mThe3h
    }
    
//    override static func primaryKey() -> String? {
//        return "SnowModel"
//      }
}
