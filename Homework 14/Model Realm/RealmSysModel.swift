//
//  SysModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmSysModel: Object, Codable {
    
    
    @objc dynamic var pod: String = ""
    
    convenience init(data: SysModel) {
        self.init()
        guard let mPod = data.pod
        else {return}
        self.pod = mPod
    }
    
//    override static func primaryKey() -> String? {
//        return "SysModel"
//      }
    
}
