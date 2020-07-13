//
//  MensTracksuitGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/4/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensTracksuitGoodsViewController: UIViewController {
    
    var objects: [GoodsValue] = []
    var tracksuitNameArray: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadGoods(goodsID: 42) {
            if let goods = listOfGoods {
                let array = Array(goods.values)
                array.forEach { (value) in
                    self.objects = array
                    self.tracksuitNameArray.append(value.name)
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
        title = "Спортивные костюмы"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! DetailMensTracksuitViewController
            destVC.objects = sender as? GoodsValue
        }
    }
}

extension MensTracksuitGoodsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        let height = width * 1.57
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tracksuitNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tracksuitName = objects[indexPath.row].name
        let tracksuitPrice = objects[indexPath.row].price
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tracksuit", for: indexPath) as! MensTracksuitGoodsCollectionViewCell
        cell.mensTracksuitPriceLabel.text = String(tracksuitPrice.dropLast(5)) + " руб."
        cell.mensTracksuitNameLabel.text = tracksuitName
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
