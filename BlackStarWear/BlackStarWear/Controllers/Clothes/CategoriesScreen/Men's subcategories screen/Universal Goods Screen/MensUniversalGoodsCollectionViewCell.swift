//
//  MensUniversalGoodsCollectionViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 7/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensUniversalGoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mensUniversalImageView: UIImageView!
    @IBOutlet weak var mensUniversalPriceLabel: UILabel!
    @IBOutlet weak var mensUniversalNameLabel: UILabel!
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes)
        -> UICollectionViewLayoutAttributes {
      return layoutAttributes
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.mensUniversalImageView.image = image
            }
        }
    }
}
