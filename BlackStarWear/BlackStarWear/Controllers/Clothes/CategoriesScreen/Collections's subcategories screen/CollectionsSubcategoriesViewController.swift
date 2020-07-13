//
//  CollectionsSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/10/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class CollectionsSubcategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfCollectionsSubcategories: [String] = []
    var sortedCollectionsSubcategories: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    if value.subcategories.count == 0 {
                        return
                    } else if Int(value.sortOrder) == 11 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfCollectionsSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Generation 13", "Gold Lion", "Terminal 13", "KIDS ID", "Art Spray", "RUS", "LUX", "BB LINES", "Коллекция Black Star Mafia", "Wings", "BSW Design", "UNIT", "BS Color", "CALLIGRAPHY", "Пашу", "Likee", "MOT Merch", "Natan", "Все товары категории")
                let someSubcategories = self.arrayOfCollectionsSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedCollectionsSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
            }
//        }
    }

}

extension CollectionsSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedCollectionsSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Generation13") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoldLion") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Terminal13") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "KIDSID") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 4 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArtSpray") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "RUS") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "LUX") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BBLINES") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 8 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlackStarMafia") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 9 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Wings") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 10 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BSWDesign") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 11 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "UNIT") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 12 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BSColor") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 13 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CALLIGRAPHY") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 14 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Пашу") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 15 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Likee") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 16 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "MOTMerch") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 17 {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Natan") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        } else {
           let subcategory = sortedCollectionsSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGoods") as! CollectionsSubcategoriesTableViewCell
            cell.collectionsSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
