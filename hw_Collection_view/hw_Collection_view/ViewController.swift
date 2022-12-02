//
//  ViewController.swift
//  hw_Collection_view
//
//  Created by Valentina Terekhova on 02/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let helper = CollectionViewHelper()
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.setup(for: collectionView)
        collectionView.reloadData()

    }
    
}


