//
//  MainViewController.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import UIKit

class MainViewController: UIViewController, Storyboardable {
   
    @IBOutlet var mainLabel: UILabel!
    @IBAction func aboutButtonTapped(_ sende: Any) {
        coordinator?.showDetail()
    }
    
    weak var coordinator: AppCoordinator?
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main screen loaded")
        mainLabel.text = "Hello, \(viewModel?.login ?? "User")"
    }
}
