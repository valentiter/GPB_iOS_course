//
//  ViewController.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import UIKit

class LoginViewController: UIViewController, Storyboardable {
    
    var viewModel: LoginViewModel?
    var coordinator: AppCoordinator?
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButtonTapped(_ sender: Any) {
        viewModel!.userButtonPressed(login: (loginField.text ?? ""), password: (passwordField.text ?? ""))
        if viewModel!.isLoggedIn {
            coordinator?.isLoggedIn = viewModel!.isLoggedIn
            coordinator?.showMain(login: loginField.text ?? "")
        }
    }
    @IBOutlet weak var statusLabel: UILabel!
    
    func initialState() {
        statusLabel.textColor = UIColor.white
        statusLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }

    func  bindViewModel() {
        viewModel!.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        viewModel!.statusColor.bind({(statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        })
    }

}

