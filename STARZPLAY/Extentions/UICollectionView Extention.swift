//
//  UICollectionView Extention.swift
//  STARZPLAY
//
//  Created by Umair on 31/03/2024.
//

import UIKit
extension UICollectionView {
    func centerIndexPath() -> IndexPath? {
        let centerPoint = CGPoint(x: bounds.midX , y: 90)
        
        if let indexPath = indexPathForItem(at: centerPoint) {
            return indexPath
        } else {
            let closestIndexPath = indexPathForItem(at: convert(centerPoint, to: self))
            return closestIndexPath
        }
    }
}
