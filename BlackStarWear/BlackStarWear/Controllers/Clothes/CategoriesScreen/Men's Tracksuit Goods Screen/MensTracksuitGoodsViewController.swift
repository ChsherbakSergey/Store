//
//  MensTracksuitGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/4/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensTracksuitGoodsViewController: UIViewController {
    
    //Creating Arrays to fill them with data from JSON
    var tracksuitNameArray: [String] = []
    var tracksuitImageArray: [String] = []
    var tracksuitPriceArray: [String] = []
    var tracksuitColorArray: [String] = []
    var tracksuitArticulArray: [String] = []
    var tracksuitDecorativeElementArray: [String] = []
    var tracksuitDrawingArray: [String] = []
    var tracksuitSesonArray: [String] = []
    var tracksuitCompositionArray: [String] = []
    var tracksuitMadeInArray: [String] = []
    var tracksuitLookAfterArray: [String] = []
    var tracksuitDescriptionArray: [String] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadGoods(goodsID: 42) {
            if let goods = listOfGoods {
                let array = Array(goods.values)
                array.forEach { (value) in
                    self.tracksuitNameArray.append(value.name)
                    self.tracksuitImageArray.append(value.mainImage)
                    self.tracksuitPriceArray.append(value.price)
                    self.tracksuitColorArray.append(value.colorName.rawValue)
                    self.tracksuitArticulArray.append(value.article)
                    self.tracksuitDecorativeElementArray.append(value.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано")
                    self.tracksuitDrawingArray.append(value.attributes[1].рисунок?.rawValue ?? "Не указано")
                    self.tracksuitSesonArray.append(value.attributes[2].сезон?.rawValue ?? "Не указано")
                    self.tracksuitCompositionArray.append(value.attributes[3].состав?.rawValue ?? "Не указано")
                    self.tracksuitMadeInArray.append(value.attributes[4].странаПроизводителя?.rawValue ?? "Не указано")
                    self.tracksuitLookAfterArray.append(value.attributes[4].уходЗаВещами?.rawValue ?? "Не указано")
                    self.tracksuitDescriptionArray.append(value.goodsDescription.replacingOccurrences(of: "&nbsp;", with: ""))
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    print(self.tracksuitDecorativeElementArray)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! DetailMensTracksuitViewController
            destVC.tracksuitData = (sender as? [String])!
        }
    }
}

extension MensTracksuitGoodsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.size.width / 2
//        let width = UIScreen.main.bounds.size.width / 2
//        let height = UIScreen.main.bounds.size.height / 3
//        let height = width * 1.54
//        return CGSize(width: width, height: height)
        if indexPath.row == 0 {
            let width = UIScreen.main.bounds.size.width / 2
            let height = width * 1.52
            return CGSize(width: width, height: height)
        } else if indexPath.row == 1 {
            let width = UIScreen.main.bounds.size.width / 2
            let height = width * 1.52
            return CGSize(width: width, height: height)
        } else {
            let width = UIScreen.main.bounds.size.width / 2
            let height = width * 1.54
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tracksuitNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tracksuitName = tracksuitNameArray[indexPath.row]
        let tracksuitPrice = tracksuitPriceArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tracksuit", for: indexPath) as! MensTracksuitGoodsCollectionViewCell
        cell.mensTracksuitPriceLabel.text = String(tracksuitPrice.dropLast(5)) + " руб."
        cell.mensTracksuitNameLabel.text = tracksuitName
        cell.setImage(from: "https://blackstarshop.ru/" + "\(tracksuitImageArray[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = [tracksuitNameArray[indexPath.row], tracksuitPriceArray[indexPath.row], tracksuitImageArray[indexPath.row], tracksuitColorArray[indexPath.row], tracksuitArticulArray[indexPath.row], tracksuitDecorativeElementArray[indexPath.row], tracksuitDrawingArray[indexPath.row], tracksuitSesonArray[indexPath.row], tracksuitCompositionArray[indexPath.row], tracksuitMadeInArray[indexPath.row], tracksuitLookAfterArray[indexPath.row], tracksuitDescriptionArray[indexPath.row]]
        performSegue(withIdentifier: "ToDetail", sender: data)
    }
    
}
