//
//  ProductsInShoppingBagViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/20/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ProductsInShoppingBagViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var name: String = "Something"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let vc = UniversalDetailGoodsViewController()
//        vc.delegate = self
        print(name)
    }

}

//extension ProductsInShoppingBagViewController: UniversalDetailGoodsViewControllerDelegate {
//    func productData(name: String) {
//        self.name = name
//    }
//
//
//}
