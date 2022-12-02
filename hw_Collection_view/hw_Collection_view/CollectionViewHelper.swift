//
//  CollectionViewHelper.swift
//  hw_Collection_view
//
//  Created by Valentina Terekhova on 02/12/2022.
//

import UIKit

class CollectionViewHelper: NSObject {
    
    let plants: [Plant] = [
        Plant(name: "Каланхоэ Блоссфельда", image: "Kalanchoe_blossfeldiana"),
        Plant(name: "Подокарпус", image: "Podocarpus"),
        Plant(name: "Крассула яйцевидная", image: "Crassula_ovata"),
        Plant(name: "Примула Акаулис", image: "Acaulis_primrose"),
        Plant(name: "Клеродендрум угандийский", image: "Ugandan_Clerodendrum"),
        Plant(name: "Бегония вечноцветущая", image: "Begonia"),
        Plant(name: "Вашингтония нитеносная", image: "Washingtonia_robusta"),
        Plant(name: "Хамедорея изящная", image: "Hamedorrhea_delicata"),
        Plant(name: "Финик Робелена", image: "Phoenix_roebellenii")
        ]
    
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    func setup(for collectionView: UICollectionView) {
        collectionView.register(for: PlantCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CollectionViewHelper: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: PlantCell.self, for: indexPath)
        let myplant = plants[indexPath.item]
        cell.update(from: myplant)
        return cell
    }
}

extension CollectionViewHelper: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInserts
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.right
    }

}
