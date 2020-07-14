//
//  UniversalGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class UniversalGoodsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var objects: [GoodsValue] = []
    var universalNameArray: [String] = []
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
                    self.universalNameArray.append(value.name)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! UniversalDetailGoodsViewController
            destVC.objects = sender as? GoodsValue
        }
    }

}

extension UniversalGoodsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        universalNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let universalName = objects[indexPath.row].name
        let universalPrice = objects[indexPath.row].price
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Universal", for: indexPath) as! UniversalGoodsCollectionViewCell
        cell.universalPriceLabel.text = String(universalPrice.dropLast(5)) + " руб."
        cell.universalNameLabel.text = universalName
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
