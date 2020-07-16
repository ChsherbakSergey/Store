//
//  OutletsSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/10/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class OutletsSubcategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfOutletsSubcategories: [String] = []
    var sortedOutletsSubcategories: [String] = []
    
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
                    } else if Int(value.sortOrder) == 99 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfOutletsSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Для мужчин", "Для женщин", "Для детей", "Аксессуары")
                let someSubcategories = self.arrayOfOutletsSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedOutletsSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
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
        if segue.identifier == "Men" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Для мужчин"
        }
        if segue.identifier == "Women" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Для женщин"
        }
        if segue.identifier == "Children" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Для детей"
        }
        if segue.identifier == "Accessories" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Аксессуары"
        }
    }
    
    
}


extension OutletsSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedOutletsSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedOutletsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForMen") as! OutletsSubcategoriesTableViewCell
            cell.outletsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedOutletsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForWomen") as! OutletsSubcategoriesTableViewCell
            cell.outletsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = sortedOutletsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForChildren") as! OutletsSubcategoriesTableViewCell
            cell.outletsSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedOutletsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Accessories") as! OutletsSubcategoriesTableViewCell
            cell.outletsSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let data = 157
            performSegue(withIdentifier: "Men", sender: data)
        }
        if indexPath.row == 1 {
            let data = 158
            performSegue(withIdentifier: "Women", sender: data)
        }
        if indexPath.row == 2 {
            let data = 159
            performSegue(withIdentifier: "Children", sender: data)
        }
        if indexPath.row == 3 {
            let data = 160
            performSegue(withIdentifier: "Accessories", sender: data)
        }
    }
    
}
