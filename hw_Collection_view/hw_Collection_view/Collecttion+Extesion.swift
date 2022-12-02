//
//  Collecttion+Extesion.swift
//  hw_Collection_view
//
//  Created by Valentina Terekhova on 02/12/2022.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(for classType: T.Type) {
        let name = "\(classType)"
        let nib = UINib(nibName: name, bundle: Bundle.main)
        self.register(nib, forCellWithReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> (for classType: T.Type, for indexPath: IndexPath) -> T{
        return dequeueReusableCell(withReuseIdentifier: "\(classType)", for: indexPath) as! T
    }
}
