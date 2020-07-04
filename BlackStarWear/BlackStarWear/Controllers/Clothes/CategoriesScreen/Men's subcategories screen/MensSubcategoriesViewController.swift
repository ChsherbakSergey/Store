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
                    } else if Int(value.sortOrder) == 0 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
//                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfMenSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //Sorting of catagories array beign made by sortedArray function
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Все товары категории")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Пижамы")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Шорты")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Брюки")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Куртки и бомберы")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Толстовки и худи")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Футболки и майки")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Спортивные костюмы")
                self.arrayOfMenSubcategories = sortedArray(array: self.arrayOfMenSubcategories, string: "Джинсы")
                self.arrayOfMenSubcategories.removeLast(39)
//                print(self.arrayOfMenSubcategories)
            }
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
        arrayOfMenSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jeans") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tracksuit") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "T-Shirt") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Hoodie") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 4 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Jacket") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pants") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Shorts") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pyjamas") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = arrayOfMenSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGoods") as! MensSubcategoryTableViewCell
            cell.mensSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
