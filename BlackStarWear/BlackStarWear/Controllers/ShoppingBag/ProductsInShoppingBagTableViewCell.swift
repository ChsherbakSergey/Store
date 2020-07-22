//
//  ProductsInShoppingBagTableViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 7/20/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ProductsInShoppingBagTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.productImageView.image = image
            }
        }
    }
}
