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
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
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
                if listOfGoodsInArray?.count == 0 {
                    Alert.showIncorrectFormatJSONAlert(on: self)
                }
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indicatorView.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicatorView.stopAnimating()
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
            destVC.checkForItem = titleOfNavigationBar
        }
    }

}

extension UniversalGoodsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        let height = width * 1.62
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        universalNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let universalName = objects[indexPath.row].name.replacingOccurrences(of: "amp;", with: "")
        let universalPrice = objects[indexPath.row].price
        let universalTag = objects[indexPath.row].tag
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Universal", for: indexPath) as! UniversalGoodsCollectionViewCell
        cell.universalPriceLabel.text = String(universalPrice.dropLast(5)) + " руб."
        let universalOldPrice = objects[indexPath.row].oldPrice
        let universalOldPriceStrikeThrough = String((universalOldPrice?.dropLast(5) ?? "1990")) + " руб."
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: universalOldPriceStrikeThrough )
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        if universalOldPrice == nil {
            cell.universalOldPriceLabel.text = ""
            cell.priceLabelTopConstraint.constant = 5
            cell.nameLabelTopConstraint.constant = 10
            cell.universalPriceLabel.textColor = UIColor.black
        } else {
            cell.universalOldPriceLabel.attributedText = attributeString
            cell.priceLabelTopConstraint.constant = 20
            cell.nameLabelTopConstraint.constant = 5
            cell.universalPriceLabel.textColor = UIColor.red
        }
        cell.universalNameLabel.text = universalName
        cell.universalTagLabel.layer.masksToBounds = true
        cell.universalTagLabel.layer.cornerRadius = 2
        if universalTag == nil {
            cell.universalTagLabel.backgroundColor = UIColor.white
        } else if universalTag == "new" {
            cell.universalTagLabel.backgroundColor = UIColor.systemGreen
            cell.universalTagLabel.text = universalTag
        } else {
            cell.universalTagLabel.text = universalTag
            cell.universalTagLabel.backgroundColor = UIColor.red
        }
        
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
