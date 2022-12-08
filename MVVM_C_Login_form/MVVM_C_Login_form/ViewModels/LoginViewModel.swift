//
//  ViewModel.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.white)
    var isLoggedIn = false
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Log in failed."
            statusColor.value = UIColor.red
            isLoggedIn = false
        } else {
            statusText.value = "Logged in successfully"
            statusColor.value = UIColor.green
            isLoggedIn = true
        }
    }
}

