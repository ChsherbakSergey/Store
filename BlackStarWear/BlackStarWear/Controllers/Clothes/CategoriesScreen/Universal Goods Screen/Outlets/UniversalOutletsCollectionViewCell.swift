//
//  UniversalOutletsCollectionViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 7/15/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class UniversalOutletsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var universalOutletsImageView: UIImageView!
    @IBOutlet weak var universalOutletsOldPrice: UILabel!
    @IBOutlet weak var universalOutletsPriceLabel: UILabel!
    @IBOutlet weak var universalOutletsTagLabel: UILabel!
    @IBOutlet weak var universalOutletsNameLabel: UILabel!
    
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
                self.universalOutletsImageView.image = image
            }
        }
    }
}
