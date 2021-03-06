//
//  NewsSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/10/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class NewsSubcategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfNewsSubcategories: [String] = []
    var sortedNewsSubcategories: [String] = []
    
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
                    } else if value.name == "Новинки" && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfNewsSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Для мужчин", "Для женщин", "Для детей", "Аксессуары")
                let someSubcategories = self.arrayOfNewsSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedNewsSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
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

extension NewsSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedNewsSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedNewsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForMen") as! NewsSubcategoriesTableViewCell
            cell.newsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedNewsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForWomen") as! NewsSubcategoriesTableViewCell
            cell.newsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row ==  2 {
            let subcategory = sortedNewsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForChildren") as! NewsSubcategoriesTableViewCell
            cell.newsSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedNewsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Accessories") as! NewsSubcategoriesTableViewCell
            cell.newsSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let data = 166
            performSegue(withIdentifier: "Men", sender: data)
        }
        if indexPath.row == 1 {
            let data = 167
            performSegue(withIdentifier: "Women", sender: data)
        }
        if indexPath.row == 2 {
            let data = 168
            performSegue(withIdentifier: "Children", sender: data)
        }
        if indexPath.row == 3 {
            let data = 169
            performSegue(withIdentifier: "Accessories", sender: data)
        }
    }
    
}
