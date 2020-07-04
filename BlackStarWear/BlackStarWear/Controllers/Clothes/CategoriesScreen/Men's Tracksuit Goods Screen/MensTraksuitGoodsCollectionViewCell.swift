//
//  MensTraksuitGoodsCollectionViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 7/4/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensTracksuitGoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mensTracksuitImageView: UIImageView!
    @IBOutlet weak var mensTracksuitPriceLabel: UILabel!
    @IBOutlet weak var mensTracksuitNameLabel: UILabel!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes)
        -> UICollectionViewLayoutAttributes {
      return layoutAttributes
    }
}
