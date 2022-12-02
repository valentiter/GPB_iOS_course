//
//  PlantCell.swift
//  hw_Collection_view
//
//  Created by Valentina Terekhova on 02/12/2022.
//

import UIKit

class PlantCell: UICollectionViewCell {
    @IBOutlet weak var plantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 1
    }
    
    func update(from myplant: Plant) {
        let myimage: UIImage = UIImage(named: myplant.image)  ?? UIImage(named: "Plant")!
        self.plantImage.image = myimage
    }
}
