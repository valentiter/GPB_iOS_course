//
//  ViewController.swift
//  hw_table_view
//
//  Created by Valentina Terekhova on 28/11/2022.
//

import UIKit

class PlantSpeciesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var viewController: UIViewController?
    
    let plants: [Plant] = [
        Plant(name: "Каланхоэ Блоссфельда"),
        Plant(name: "Подокарпус"),
        Plant(name: "Крассула яйцевидная"),
        Plant(name: "Примула Акаулис"),
        Plant(name: "Клеродендрум угандийский"),
        Plant(name: "Бегония вечноцветущая"),
        Plant(name: "Пальма феникс"),
        Plant(name: "Хамедорея изящная"),
        Plant(name: "Финик Робелена")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}



extension PlantSpeciesViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PlantDetailsViewController") as? PlantDetailsViewController {
            let plant = plants[indexPath.row]
            vc.myplant = plant
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension PlantSpeciesViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let itemForTable = plants[indexPath.row]
        cell.textLabel?.text = itemForTable.name
        return cell
    }
}
