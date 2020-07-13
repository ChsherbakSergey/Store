//
//  MensSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/4/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensSubcategoriesViewController: UIViewController {
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfMenSubcategories: [String] = []
    var sortedMensSubcategories: [String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        
        //Delegates
        tableView.delegate = self
        tableView.dataSource = self
//        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    if value.subcategories.count == 0 {
                        return
                    } else if Int(value.sortOrder) == 0 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfMenSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Джинсы", "Спортивные костюмы", "Футболки и майки", "Толстовки и худи", "Куртки и бомберы", "Брюки", "Шорты", "Пижамы", "Все товары категории")
                let someSubcategories = self.arrayOfMenSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedMensSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
            }
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Jacket" {
            let destVC = segue.destination as! MensUniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Куртки и бомберы"
        }
        if segue.identifier == "Pants" {
            let destVC = segue.destination as! MensUniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Брюки"
        }
        if segue.identifier == "Shorts" {
            let destVC = segue.destination as! MensUniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Шорты"
        }
        if segue.identifier == "Pyjamas" {
            let destVC = segue.destination as! MensUniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Пижамы"
        }
        if segue.identifier == "AllGoods" {
            let destVC = segue.destination as! MensUniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Все товары категории"
        }
    }
    
}

func sortedArray(array: [String], string: String) -> [String] {
    var sortedArray = array
    for value in sortedArray {
        if value == string {
            sortedArray.insert(value, at: 0)
        }
    }
    return sortedArray
}

extension MensSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedMensSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jeans") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tracksuit") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "T-Shirt") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Hoodie") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 4 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jacket") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pants") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shorts") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pyjamas") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedMensSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGoods") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 4 {
            let data = 38
            performSegue(withIdentifier: "Jacket", sender: data)
        }
        if indexPath.row == 5 {
            let data = 36
            performSegue(withIdentifier: "Pants", sender: data)
        }
        if indexPath.row == 6 {
            let data = 172
            performSegue(withIdentifier: "Shorts", sender: data)
        }
        if indexPath.row == 7 {
            let data = 314
            performSegue(withIdentifier: "Pyjamas", sender: data)
        }
        if indexPath.row == 8 {
            let data = 69
            performSegue(withIdentifier: "AllGoods", sender: data)
        }
    }
}
