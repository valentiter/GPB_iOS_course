//
//  UserData.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
}

extension UserData {
    static var userData = UserData(name: "John", city: "New York")
}
