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
        print(name)
    }

}
