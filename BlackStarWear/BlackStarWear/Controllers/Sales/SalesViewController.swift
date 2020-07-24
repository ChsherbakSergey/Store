//
//  ViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class SalesController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var objects: [GoodsValue] = []
    var outletsNameArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadGoods(goodsID: 156) {
            if let goods = listOfGoods {
                let array = Array(goods.values)
                array.forEach { (value) in
                    self.objects = array
                    self.outletsNameArray.append(value.name)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
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
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 16)!]
        navigationItem.title = "Скидки"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ToDetail" {
            let destVC = segue.destination as! SalesDetailViewController
            destVC.objects = sender as? GoodsValue
//            destVC.checkForItem = titleOfNavigationBar
        }
    }
    
    
}


extension SalesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 2
        let height = width * 1.65
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        outletsNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let outletsName = objects[indexPath.row].name.replacingOccurrences(of: "amp;", with: "")
        let outletsPrice = objects[indexPath.row].price
        let outletsTag = objects[indexPath.row].tag
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Outlets", for: indexPath) as! SalesCollectionViewCell
        cell.salesPriceLabel.text = String(outletsPrice.dropLast(5)) + " руб."
        let outletsOldPrice = objects[indexPath.row].oldPrice
        let outletsOldPriceStrikeThrough = String((outletsOldPrice?.dropLast(5) ?? "1990")) + " руб."
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: outletsOldPriceStrikeThrough )
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        if outletsOldPrice == nil {
            cell.salesOldPriceLabel.text = ""
            cell.salesPriceLabel.textColor = UIColor.black
        } else {
            cell.salesOldPriceLabel.attributedText = attributeString
            cell.salesPriceLabel.textColor = UIColor.red
        }
        cell.salesNameLabel.text = outletsName
        cell.salesTagLabel.layer.masksToBounds = true
        cell.salesTagLabel.layer.cornerRadius = 2
        if outletsTag == nil {
            cell.salesTagLabel.backgroundColor = UIColor.white
        } else if outletsTag == "new" {
            cell.salesTagLabel.backgroundColor = UIColor.systemGreen
            cell.salesTagLabel.text = outletsTag
        } else {
            cell.salesTagLabel.text = outletsTag
            cell.salesTagLabel.backgroundColor = UIColor.red
        }
        
        cell.setImage(from: "https://blackstarshop.ru/" + "\(objects[indexPath.row].mainImage)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let object = self.objects[indexPath.item]
        performSegue(withIdentifier: "ToDetail", sender: object)
    }
    
}
