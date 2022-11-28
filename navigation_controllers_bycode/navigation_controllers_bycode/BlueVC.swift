//
//  BlueVC.swift
//  navigation_controllers_bycode
//
//  Created by Valentina Terekhova on 28/11/2022.
//

import UIKit

class BlueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("💙 Did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("💙 Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("💙 Disappear")
    }
}
