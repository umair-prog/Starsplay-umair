//
//  CollectionViewTopAlignLayout.swift
//  STARZPLAY
//
//  Created by umair on 31/03/2024.
//

import UIKit
class TopAlignedFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
        
        var updatedAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in superAttributes {
            if attributes.representedElementCategory == .cell {
                if let collectionView = collectionView {
                    let topInset = collectionView.contentInset.top
                    var frame = attributes.frame
                    frame.origin.y = min(frame.origin.y, collectionView.contentOffset.y + topInset)
                    attributes.frame = frame
                }
            }
            updatedAttributes.append(attributes)
        }
        
        return updatedAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
