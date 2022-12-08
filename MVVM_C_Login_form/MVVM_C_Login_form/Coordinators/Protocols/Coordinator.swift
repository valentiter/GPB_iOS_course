//
//  Coordinator.swift
//  MVVM_C_Login_form
//
//  Created by Valentina Terekhova on 06/12/2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
