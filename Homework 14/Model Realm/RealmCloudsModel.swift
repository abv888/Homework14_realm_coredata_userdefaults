//
//  CloudsModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmCloudsModel: Object, Codable {
   

    
    @objc dynamic var all: Int = 0
    
    convenience init(data: CloudsModel) {
        self.init()
        guard let mAll = data.all
        else {return}
        self.all = mAll
    }
    
    
//    override static func primaryKey() -> String? {
//        return "CloudsModel"
//      }
}
