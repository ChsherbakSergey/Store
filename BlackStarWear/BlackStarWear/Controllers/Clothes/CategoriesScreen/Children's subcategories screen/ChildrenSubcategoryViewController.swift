//
//  ChildrenSubcategoryViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/10/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ChildrenSubcategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfChildrenSubcategories: [String] = []
    var sortedChildrenSubcategories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
//        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    if value.subcategories.count == 0 {
                        return
                    } else if Int(value.sortOrder) == 28 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfChildrenSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Спортивные костюмы", "Футболки и платья", "Толстовки", "Куртки и бомберы", "Брюки и леггинсы", "Шорты")
                let someSubcategories = self.arrayOfChildrenSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedChildrenSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
            }
//        }
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
        if segue.identifier == "T-ShirtAndDress" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Футболки и платья"
        }
        if segue.identifier == "Hoodie" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Толстовки"
        }
        if segue.identifier == "Jacket" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Куртки и бомберы"
        }
        if segue.identifier == "Pants" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Брюки и леггинсы"
        }
        if segue.identifier == "Shorts" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Шорты"
        }
    }
    
    
    
}

extension ChildrenSubcategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedChildrenSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tracksuit") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "T-shirt") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Hoodie") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jacket") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 4 {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pants") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedChildrenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shorts") as! ChildrenSubcategoryTableViewCell
            cell.childrenSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let data = 181
            performSegue(withIdentifier: "Tracksuit", sender: data)
        }
        if indexPath.row == 1 {
            let data = 180
            performSegue(withIdentifier: "T-ShirtAndDress", sender: data)
        }
        if indexPath.row == 2 {
            let data = 179
            performSegue(withIdentifier: "Hoodie", sender: data)
        }
        if indexPath.row == 3 {
            let data = 177
            performSegue(withIdentifier: "Jacket", sender: data)
        }
        if indexPath.row == 4 {
            let data = 178
            performSegue(withIdentifier: "Pants", sender: data)
        }
        if indexPath.row == 5 {
            let data = 185
            performSegue(withIdentifier: "Shorts", sender: data)
        }
    }
    
}
