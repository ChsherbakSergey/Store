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
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
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
        let urlString = "https://blackstarshop.ru/" + "\(tracksuitImageArray[indexPath.row])"
        let imageUrl = URL(string: urlString)
        
        do {
            let image = try Data(contentsOf: imageUrl!)
            cell.mensTracksuitImageView.image = UIImage(data: image)
            cell.mensTracksuitImageView.contentMode = .scaleAspectFit
            cell.clipsToBounds = true
            
        } catch {
            print(error.localizedDescription)
        }
        return cell
    }
}
