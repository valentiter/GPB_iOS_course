//
//  PlantDetailsViewController.swift
//  hw_table_view
//
//  Created by Valentina Terekhova on 29/11/2022.
//

import Foundation
import UIKit

class PlantDetailsViewController: UIViewController {
    @IBOutlet weak var plantLabel: UILabel!
    
//    var myPlant: Plant = Plant.init(name: "Name of your plant")
    var myplant = Plant(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plantLabel.text = myplant.name
    }
}
