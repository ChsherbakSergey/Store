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
        setNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
//        loadCategories() {
            if let categories = listOfCategories {
                let array = Array(categories.values)
                array.forEach { (value) in
                    if value.subcategories.count == 0 {
                        return
                    } else if value.name == "Женская" && value.subcategories.count != 0 {
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
    
    func setNavigationBar() {
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Generation13" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Generation 13"
        }
        if segue.identifier == "GoldLion" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Gold Lion"
        }
        if segue.identifier == "Terminal13" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Terminal 13"
        }
        if segue.identifier == "KIDSID" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "KIDS ID"
        }
        if segue.identifier == "ArtSpray" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Art Spray"
        }
        if segue.identifier == "RUS" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "RUS"
        }
        if segue.identifier == "LUX" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "LUX"
        }
        if segue.identifier == "BBLINES" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "BBLINES"
        }
        if segue.identifier == "BlackStarMafia" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Коллекция Black Star Mafia"
        }
        if segue.identifier == "Wings" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Wings"
        }
        if segue.identifier == "BSWDesign" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "BSW Design"
        }
        if segue.identifier == "UNIT" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "UNIT"
        }
        if segue.identifier == "BSColor" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "BS Color"
        }
        if segue.identifier == "Calligraphy" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "CALLIGRAPHY"
        }
        if segue.identifier == "Пашу" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Пашу"
        }
        if segue.identifier == "Likee" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Likee"
        }
        if segue.identifier == "MOTMerch" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "MOT Merch"
        }
        if segue.identifier == "Natan" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Natan"
        }
        if segue.identifier == "AllGoods" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Все товары категории"
        }
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
        if indexPath.row == 0 {
            let data = 301
            performSegue(withIdentifier: "Generation13", sender: data)
        }
        if indexPath.row == 1 {
            let data = 302
            performSegue(withIdentifier: "GoldLion", sender: data)
        }
        if indexPath.row == 2 {
            let data = 303
            performSegue(withIdentifier: "Terminal13", sender: data)
        }
        if indexPath.row == 3 {
            let data = 304
            performSegue(withIdentifier: "KIDSID", sender: data)
        }
        if indexPath.row == 4 {
            let data = 305
            performSegue(withIdentifier: "ArtSpray", sender: data)
        }
        if indexPath.row == 5 {
            let data = 306
            performSegue(withIdentifier: "RUS", sender: data)
        }
        if indexPath.row == 6 {
            let data = 313
            performSegue(withIdentifier: "LUX", sender: data)
        }
        if indexPath.row == 7 {
            let data = 317
            performSegue(withIdentifier: "BBLINES", sender: data)
        }
        if indexPath.row == 8 {
            let data = 131
            performSegue(withIdentifier: "BlackStarMafia", sender: data)
        }
        if indexPath.row == 9 {
            let data = 300
            performSegue(withIdentifier: "Wings", sender: data)
        }
        if indexPath.row == 10 {
            let data = 316
            performSegue(withIdentifier: "BSWDesign", sender: data)
        }
        if indexPath.row == 11 {
            let data = 189
            performSegue(withIdentifier: "UNIT", sender: data)
        }
        if indexPath.row == 12 {
            let data = 318
            performSegue(withIdentifier: "BSColor", sender: data)
        }
        if indexPath.row == 13 {
            let data = 251
            performSegue(withIdentifier: "Calligraphy", sender: data)
        }
        if indexPath.row == 14 {
            let data = 298
            performSegue(withIdentifier: "Пашу", sender: data)
        }
        if indexPath.row == 15 {
            let data = 319
            performSegue(withIdentifier: "Likee", sender: data)
        }
        if indexPath.row == 16 {
            let data = 151
            performSegue(withIdentifier: "MOTMerch", sender: data)
        }
        if indexPath.row == 17 {
            let data = 241
            performSegue(withIdentifier: "Natan", sender: data)
        }
        if indexPath.row == 18 {
            let data = 68
            performSegue(withIdentifier: "AllGoods", sender: data)
        }
    }
    
}
