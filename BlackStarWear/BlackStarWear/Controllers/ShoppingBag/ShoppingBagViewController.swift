//
//  ShoppingBagViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ShoppingBagViewController: UIViewController {

    @IBOutlet weak var emptyShoppingBagContainerView: UIView!
    @IBOutlet weak var productsInShoppingBagContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 16)!]
        navigationItem.title = "Корзина"
    }

}
