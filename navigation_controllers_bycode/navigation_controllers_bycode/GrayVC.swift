//
//  GrayVC.swift
//  navigation_controllers_bycode
//
//  Created by Valentina Terekhova on 28/11/2022.
//

import UIKit

class GrayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤍 Did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("🤍 Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("🤍 Disappear")
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            print("🤍 destroy")
        }
    }
    
    @IBAction func goToRootBlueTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
