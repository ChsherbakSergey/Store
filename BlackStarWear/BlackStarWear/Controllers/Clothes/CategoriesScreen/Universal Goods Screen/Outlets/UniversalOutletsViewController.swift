//
//  UniversalOutletsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/15/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class UniversalOutletsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var objects: [GoodsValue] = []
    var universalOutletsNameArray: [String] = []
    var id: Int?
    var titleOfNavigationBar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadGoods(goodsID: id!) {
            if let goods = listOfGoods {
                let array = Array(goods.values)
                array.forEach { (value) in
                    self.objects = array
                    self.universalOutletsNameArray.append(value.name)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func setNavigationBar() {
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        title = titleOfNavigationBar
    }
    
}

extension UniversalOutletsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        let height = width * 1.6
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        universalOutletsNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let universalOutletsName = objects[indexPath.row].name
        let universalOutletsPrice = objects[indexPath.row].price
        let universalOutletsOldPrice = objects[indexPath.row].oldPrice
        let universalOutletOldPriceStrikeThrough = String((universalOutletsOldPrice?.dropLast(5) ?? "1990")) + " руб."
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: universalOutletOldPriceStrikeThrough )
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        
        let universalTag = objects[indexPath.row].tag
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UniversalOutlets", for: indexPath) as! UniversalOutletsCollectionViewCell
        cell.universalOutletsPriceLabel.text = String(universalOutletsPrice.dropLast(5)) + " руб."
        cell.universalOutletsNameLabel.text = universalOutletsName
        cell.universalOutletsOldPrice.attributedText = attributeString
        cell.universalOutletsTagLabel.text = universalTag
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
