//
//  DTaskViewController.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 28.01.2021.
//

import UIKit

class DTaskViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var requestModel: RequestModel! {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = self.requestModel.city.name
            }
            
        }
    }
    
    
    var loadedFlag = false
    
    var timer = Timer()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = UserDefaults.standard.string(forKey: UDWeatherKeys.cityNameKey)
        view.backgroundColor = UIColor.lightGray
        self.setupNavBar()
        let nib = UINib(nibName: "DTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCell")
        tableView.rowHeight = 100
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    fileprivate func setupNavBar() {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        

}
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        timer.invalidate()
        if city.count > 1 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                WeatherLoader.shared.loadWeather2(city: city, result: { (model) in
                    if model != nil{
                        self.requestModel = model
                        self.loadedFlag = true
                        WeatherUserDefaultsPersistance.shared.listCountUD = self.requestModel.list.count
                        WeatherUserDefaultsPersistance.shared.cityNameUD = self.requestModel.city.name
                        
                        

                        
                        
                    }
                
                    
            
                })
            
            })
            
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return UserDefaults.standard.integer(forKey: UDWeatherKeys.countKey)
        
       
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! DTableViewCell
        cell.backgroundColor = UIColor.lightGray
        
        
        if loadedFlag {
            WeatherUserDefaultsPersistance.shared.dtUD = self.requestModel.list[indexPath.row].dt_txt!
            WeatherUserDefaultsPersistance.shared.tempUD = String(Int(self.requestModel.list[indexPath.row].main!.temp!))
            
            if let iconDataMain = try? Data(contentsOf: URL(string: "http://openweathermap.org/img/wn/\(self.requestModel.list[indexPath.row].weather![0].icon!)@2x.png")!){
            cell.myImageView.image = UIImage(data: iconDataMain)!}
        }
        
        
        let datetext = UserDefaults.standard.string(forKey: UDWeatherKeys.dateKey)
        let datetime = datetext!.components(separatedBy: " ")
        cell.dateLabel.text = datetime[0]
        cell.taskLabel.text = datetime[1]
        cell.tempLabel.text = UserDefaults.standard.string(forKey: UDWeatherKeys.currTempKey)! + "°С"
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
