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
    
//    var name: String = "Something"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let vc = UniversalDetailGoodsViewController()
//        vc.delegate = self
//        print(name)
        tableView.reloadData()
    }

}

//extension ProductsInShoppingBagViewController: UniversalDetailGoodsViewControllerDelegate {
//    func productData(name: String) {
//        self.name = name
//    }
//
//
//}


extension ProductsInShoppingBagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Persisitance.shared.productImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = Persisitance.shared.productName[indexPath.row]
        let size  = Persisitance.shared.productSize[indexPath.row]
        let price = Persisitance.shared.productPrice[indexPath.row]
        let image = Persisitance.shared.productImage[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product") as! ProductsInShoppingBagTableViewCell
        cell.productNameLabel.text = name
        cell.productSizeLabel.text = size
        cell.productPriceLabel.text = price
        cell.setImage(from: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Persisitance.shared.productImage.remove(at: indexPath.row)
            Persisitance.shared.productName.remove(at: indexPath.row)
            Persisitance.shared.productSize.remove(at: indexPath.row)
            Persisitance.shared.productPrice.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
