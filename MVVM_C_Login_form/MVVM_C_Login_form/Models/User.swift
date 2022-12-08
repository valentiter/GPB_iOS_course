//
//  User.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import Foundation

struct User {
    let login: String
    let password: String
}

extension User {
    static var logins = [
    User(login: "login", password: "password")
    ]
}
