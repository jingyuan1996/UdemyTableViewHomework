//
//  ViewController.swift
//  RolanHomeworkTableView
//
//  Created by Jingyuan Chew on 2025/10/6.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTabView : UITableView!
    
    var cities: [String] = ["Kuala Lumpur", "Taipei"]
    
    var cityCountry:[String : String] = ["Kuala Lumpur": "Malaysia", "Taipei":"Taiwan"]
    
    struct Constants {
        static let cellIdentifier = "MagicCityCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityTabView.register(UITableViewCell.self,
                                               forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellContentConfigutation = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfigutation.text = cityName
        print(cityName)
        cellContentConfigutation.secondaryText = cityCountry[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfigutation
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath : IndexPath){
        print("city = \(cities[indexPath.row]) country = \(cityCountry[cities[indexPath.row]] ?? "")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
