//
//  ClothesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class ClothesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoriesNamesArray = [String]()
    var subcategoriesNamesArray = [Subcategory]()
    var sortedCategoriesArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavegationBar()
        //Delegates
        tableView.delegate = self
        tableView.dataSource = self
        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    self.categoriesNamesArray.append(value.name)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //Sorting of catagories array beign made by sortedArray function
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Предзаказ")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Новинки")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Скидки")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Коллекции")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Аксессуары")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Детская")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Женская")
//                self.categoriesNamesArray = sortedArray(array: self.categoriesNamesArray, firstString: "Мужская")
//                self.categoriesNamesArray.removeLast(8)
                let categoryOrdering = HardCodedOrdering(ordering: "Мужская", "Женская", "Детская", "Аксессуары", "Коллекции", "Скидки", "Новинки")
                let someCategories = self.categoriesNamesArray
                let realCategories = someCategories.lazy.filter(categoryOrdering.contains)
                self.sortedCategoriesArray = realCategories.sorted(by: categoryOrdering.areInIncreasingOrder)
            }
        }
    }
    
    func setNavegationBar() {
        //Set backBarButtonItem
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        //Set navigation Title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 16)!]
    }
    
}

//Creating func to sort Array because API gives back categories in random order
func sortedArray(array: [String], firstString: String) -> [String] {
    var sortedArray = array
    for value in sortedArray {
        if value == firstString {
            sortedArray.insert(value, at: 0)
        }
    }
    return sortedArray
}

extension ClothesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedCategoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Men") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 1 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Women") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 2 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Children") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 3 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Accessories") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 4 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Collections") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 5 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Outlet") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else if indexPath.row == 6 {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "New") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        } else {
            let category = sortedCategoriesArray[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreOrder") as! CategoryTableViewCell
            cell.categoryNameLabel.text = category
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
