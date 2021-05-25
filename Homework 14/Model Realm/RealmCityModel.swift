//
//  CityModel.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import RealmSwift

class RealmCityModel: Object, Codable {
    
    
    @objc dynamic var id: Double = 0.0
    @objc dynamic var name: String = ""
//    @objc dynamic var coord: CoordModel?
    @objc dynamic var country: String = ""
    @objc dynamic var population: Double = 0.0
//    @objc dynamic var timezone: Int?
//    @objc dynamic var sunrise: Int?
//    @objc dynamic var sunset: Int?
    
    
    convenience init(data: CityModel) {
        self.init()
        guard let mId = data.id,
              let mName = data.name,
              let mCountry = data.country,
              let mPopulation = data.population
        else { return }
        self.id = mId
        self.name = mName
        self.country = mCountry
        self.population = mPopulation
        
    }
    
    
//    override static func primaryKey() -> String? {
//        return "CityModel"
//      }
    
}
