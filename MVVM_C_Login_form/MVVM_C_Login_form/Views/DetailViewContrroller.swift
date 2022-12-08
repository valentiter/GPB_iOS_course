//
//  DetailViewController.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import UIKit

class DetailViewController: UIViewController, Storyboardable {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    weak var coordinator: AppCoordinator?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Detail view loaded")
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = viewModel?.model?.name
        cityLabel.text = viewModel?.model?.city
    }
}
