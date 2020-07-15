//
//  AcsessoriesSubcategoriesViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/10/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class AcsessoriesSubcategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var subcategoriesNamesArray = [Subcategory]()
    var arrayOfAcsessoriesSubcategories: [String] = []
    var sortedAcsessoriesSubcategories: [String] = []
    
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
                    } else if Int(value.sortOrder) == 29 && value.subcategories.count != 0 {
                        self.subcategoriesNamesArray.append(contentsOf: value.subcategories)
                        //                        print(self.subcategoriesNamesArray.count)
                        for i in 0...self.subcategoriesNamesArray.count - 1 {
                            self.arrayOfAcsessoriesSubcategories.append(self.subcategoriesNamesArray[i].name)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                let subcategoryOrdering = HardCodedOrdering(ordering: "Ремни", "Чехлы на телефоны", "Маски, повязки на лицо", "Рюкзаки и сумки", "Бейсболки и кепки", "Носки", "Браслеты", "Очки", "Кружки", "Другое", "Все товары категории")
                let someSubcategories = self.arrayOfAcsessoriesSubcategories
                let realSubcategories = someSubcategories.lazy.filter(subcategoryOrdering.contains)
                self.sortedAcsessoriesSubcategories = realSubcategories.sorted(by: subcategoryOrdering.areInIncreasingOrder)
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
        if segue.identifier == "Belt" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Ремни"
        }
        if segue.identifier == "PhoneCase" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Чехлы на телефоны"
        }
        if segue.identifier == "Mask" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Маски, повязки на лицо"
        }
        if segue.identifier == "Backpack" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Рюкзаки и сумки"
        }
        if segue.identifier == "Cap" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Бейсболки и кепки"
        }
        if segue.identifier == "Socks" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Носки"
        }
        if segue.identifier == "Bracelet" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Браслеты"
        }
        if segue.identifier == "Glasses" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Очки"
        }
        if segue.identifier == "Cup" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Кружки"
        }
        if segue.identifier == "Other" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Другое"
        }
        if segue.identifier == "AllGoods" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Все товары категории"
        }
    }
    
}


extension AcsessoriesSubcategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedAcsessoriesSubcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Belt") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 1 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCase") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 2 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Masks") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 3 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Backpack") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 4 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cap") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 5 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Socks") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 6 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Bracelet") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 7 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Glasses") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 8 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cup") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else if indexPath.row == 9 {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Other") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        } else {
            let subcategory = sortedAcsessoriesSubcategories[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGoods") as! AcsessoriesSubcategoriesTableViewCell
            cell.acsessoriesSubcategoryNameLabel.text = subcategory
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let data = 248
            performSegue(withIdentifier: "Belt", sender: data)
        }
        if indexPath.row == 1 {
            let data = 61
            performSegue(withIdentifier: "PhoneCase", sender: data)
        }
        if indexPath.row == 2 {
            let data = 311
            performSegue(withIdentifier: "Mask", sender: data)
        }
        if indexPath.row == 3 {
            let data = 64
            performSegue(withIdentifier: "Backpack", sender: data)
        }
        if indexPath.row == 4 {
            let data = 65
            performSegue(withIdentifier: "Cap", sender: data)
        }
        if indexPath.row == 5 {
            let data = 62
            performSegue(withIdentifier: "Socks", sender: data)
        }
        if indexPath.row == 6 {
            let data = 187
            performSegue(withIdentifier: "Bracelet", sender: data)
        }
        if indexPath.row == 7 {
            let data = 217
            performSegue(withIdentifier: "Glasses", sender: data)
        }
        if indexPath.row == 8 {
            let data = 183
            performSegue(withIdentifier: "Cup", sender: data)
        }
        if indexPath.row == 9 {
            let data = 138
            performSegue(withIdentifier: "Other", sender: data)
        }
        if indexPath.row == 10 {
            let data = 67
            performSegue(withIdentifier: "AllGoods", sender: data)
        }
    }
    
}
