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
                let subcategoryOrdering = HardCodedOrdering(ordering: "Спортивные костюмы", "Футболки и майки", "Толстовки и худи", "Платья", "Рубашки", "Куртки и бомберы", "Шорты", "Брюки и леггинсы", "Юбки", "Нижнее белье", "Пижамы", "Все товары категории")
                let someSubcategories = self.arrayOfWomenSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedWomensSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
            }
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
            return cell
        } else if indexPath.row == 4 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shirt") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jacket") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shorts") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pants") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 8 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Skirt") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 9 {
            let subcategory = sortedWomensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Underwear") as! WomensSubcategoriesTableViewCell
            cell.womensSubcategoriesLabel.text = subcategory
            return cell
        } else if indexPath.row == 10 {
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
    }
    
}
