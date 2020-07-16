//
//  SalesCollectionViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 7/16/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class SalesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var salesImageView: UIImageView!
    @IBOutlet weak var salesTagLabel: UILabel!
    @IBOutlet weak var salesOldPriceLabel: UILabel!
    @IBOutlet weak var salesPriceLabel: UILabel!
    @IBOutlet weak var salesNameLabel: UILabel!
    
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
                self.salesImageView.image = image
            }
        }
    }
    
}
