//
//  MensHoodieGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/12/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensHoodieGoodsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var objects: [GoodsValue] = []
    var hoodieNameArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadGoods(goodsID: 43) {
            if let goods = listOfGoods {
                let array = Array(goods.values)
                array.forEach { (value) in
                    self.objects = array
                    self.hoodieNameArray.append(value.name)
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
        title = "Толстовки и худи"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! DetailMensHoodieViewController
            destVC.objects = sender as? GoodsValue
        }
    }
    
    
}

extension MensHoodieGoodsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = UIScreen.main.bounds.size.width / 2
            let height = width * 1.5
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hoodieNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hoodieName = objects[indexPath.row].name
        let hoodiePrice = objects[indexPath.row].price
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Hoodie", for: indexPath) as! MensHoodieGoodsCollectionViewCell
        cell.mensHoodiePriceLabel.text = String(hoodiePrice.dropLast(5)) + " руб."
        cell.MensHoodieNameLabel.text = hoodieName
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
