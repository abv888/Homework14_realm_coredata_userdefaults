//
//  WeatherLoader.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 12.02.2021.
//

import Foundation
import Alamofire
import RealmSwift


class WeatherLoader {



    private init() {}
    
    static let shared: WeatherLoader = WeatherLoader()


    func loadWeather2 (city: String, result: @escaping ((RequestModel?)->())){
        


        let API_KEY = "15bd268399be175bd78bbdb25030a9ce"
        
        AF.request("http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&lang=ru&appid=\(API_KEY)").responseDecodable(of: RequestModel.self) { response in
            result(response.value)
            
        }

    }


}
