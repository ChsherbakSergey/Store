//
//  WomensSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/9/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class WomensSubcategoriesViewController: UIViewController {
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfWomenSubcategories: [String] = []
    var sortedWomensSubcategories: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    if value.subcategories.count == 0 {
                        return
                    } else if Int(value.sortOrder) == 11 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfWomenSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Спортивные костюмы", "Футболки и майки", "Толстовки и худи", "Платья", "Куртки и бомберы", "Шорты", "Брюки и леггинсы", "Юбки", "Нижнее белье", "Пижамы", "Все товары категории")
                let someSubcategories = self.arrayOfWomenSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedWomensSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
            }
        }
    }
    
    func setNavigationBar() {
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Tracksuit" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Спортивные костюмы"
        }
        if segue.identifier == "T-shirt" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Футболки и майки"
        }
        if segue.identifier == "Hoodie" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Толстовки и худи"
        }
        if segue.identifier == "Dress" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Платья"
        }
//        if segue.identifier == "Shirt" {
//            let destVC = segue.destination as! UniversalGoodsViewController
//            destVC.id = sender as? Int
//            destVC.titleOfNavigationBar = "Рубашки"
//        }
        if segue.identifier == "Jacket" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Куртки и бомберы"
        }
        if segue.identifier == "Shorts" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Шорты"
        }
        if segue.identifier == "Pants" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Брюки и леггинсы"
        }
        if segue.identifier == "Skirt" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Юбки"
        }
        if segue.identifier == "Underwear" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Нижнее белье"
        }
        if segue.identifier == "Pyjamas" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Пижамы"
        }
        if segue.identifier == "AllGoods" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Все товары категории"
        }
    }
    
}

extension WomensSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedWomensSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tracksuit") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "T-shirt") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Hoodie") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Dress") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell }
//            else if indexPath.row == 4 {
//            let subcategory = sortedWomensSubcategories[indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Shirt") as! WomensSubcategoriesTableViewCell
//            cell.womensSubcategoriesLabel.text = subcategory
//            return cell }
            else if indexPath.row == 4 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jacket") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shorts") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pants") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Skirt") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 8 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Underwear") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 9 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pyjamas") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGoods") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let data = 57
            performSegue(withIdentifier: "Tracksuit", sender: data)
        }
        if indexPath.row == 1 {
            let data = 53
            performSegue(withIdentifier: "T-shirt", sender: data)
        }
        if indexPath.row == 2 {
            let data = 58
            performSegue(withIdentifier: "Hoodie", sender: data)
        }
        if indexPath.row == 3 {
            let data = 54
            performSegue(withIdentifier: "Dress", sender: data)
        }
//        if indexPath.row == 4 {
//            let data = 55
//            performSegue(withIdentifier: "Shirt", sender: data)
//        }
        if indexPath.row == 4 {
            let data = 48
            performSegue(withIdentifier: "Jacket", sender: data)
        }
        if indexPath.row == 5 {
            let data = 44
            performSegue(withIdentifier: "Shorts", sender: data)
        }
        if indexPath.row == 6 {
            let data = 46
            performSegue(withIdentifier: "Pants", sender: data)
        }
        if indexPath.row == 7 {
            let data = 45
            performSegue(withIdentifier: "Skirt", sender: data)
        }
        if indexPath.row == 8 {
            let data = 134
            performSegue(withIdentifier: "Underwear", sender: data)
        }
        if indexPath.row == 9 {
            let data = 315
            performSegue(withIdentifier: "Pyjamas", sender: data)
        }
        if indexPath.row == 10 {
            let data = 68
            performSegue(withIdentifier: "AllGoods", sender: data)
        }
    }
    
}
