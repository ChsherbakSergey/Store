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
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var priceLabel: UILabel!
    var newPrice: [Int] = []
    
//    var name: String = "Something"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        setTableViewHeight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let vc = UniversalDetailGoodsViewController()
//        vc.delegate = self
//        print(name)
        tableView.reloadData()
//        setTableViewHeight()
        setPrice()
    }
    
//    func setTableViewHeight() {
//        if Persisitance.shared.productImage.count == 0 {
//            tableViewHeightConstraint.constant = 0
//        } else if Persisitance.shared.productImage.count == 1 {
//            tableViewHeightConstraint.constant = 150
//        } else if Persisitance.shared.productImage.count == 2 {
//            tableViewHeightConstraint.constant = 300
//        } else if Persisitance.shared.productImage.count == 3 {
//            tableViewHeightConstraint.constant = 450
//        } else {
//            tableViewHeightConstraint.constant = 600
//        }
//    }

    func setPrice() {
//        newPrice = Persisitance.shared.productPrice.map({(Int($0) ?? 0)})
        if Persisitance.shared.productPrice.isEmpty == true {
            priceLabel.text = "0 руб."
        }
//        for i in Persisitance.shared.productPrice {
//            newPrice.append(Int(i) ?? 0)
//        }
        newPrice = Persisitance.shared.productPrice.map({(Int($0) ?? 0)})
        var summ = 0
        for i in newPrice {
            summ += i
        }
        priceLabel.text = String(summ) + " руб."
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
        cell.productPriceLabel.text = price + " руб."
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
//            setTableViewHeight()
            setPrice()
        }
    }
    
}
