//
//  SalesDetailViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/16/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class SalesDetailViewController: UIViewController {
    
    @IBOutlet weak var outletsImageView: UIImageView!
    
    @IBOutlet weak var outletsOldPriceLabel: UILabel!
    
    @IBOutlet weak var outletsTagLabel: UILabel!
    
    @IBOutlet weak var outletsPriceLabel: UILabel!
    
    @IBOutlet weak var outletsNameLabel: UILabel!
    
    @IBOutlet weak var outletsColorLabel: UILabel!
    
    @IBOutlet weak var outletsColorImageView: UIImageView!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    @IBOutlet weak var outletsArticulLabel: UILabel!
    
    @IBOutlet weak var outletsFirstParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsFirstParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsSecondParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsSecondParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsThirdParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsThirdParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsFourthParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsFourthParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsFifthParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsFifthParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsSixthParametrNameLabel: UILabel!
    
    @IBOutlet weak var outletsSixthParametrTextLabel: UILabel!
    
    @IBOutlet weak var outletsDescriptionLabel: UILabel!
    
    
    var objects: GoodsValue?
    var checkForItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(objects!.mainImage)")
    }

    func setNavigationBar() {
        title = objects?.name
    }
    
    func setUI() {
            outletsTagLabel.text = objects?.tag
            outletsArticulLabel.text = objects?.article
            outletsPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
            outletsNameLabel.text = objects?.name
            let outletsOldPriceStrikeThrough = String(objects?.oldPrice?.dropLast(5) ?? "0") + " руб."
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: outletsOldPriceStrikeThrough )
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            outletsOldPriceLabel.attributedText = attributeString
            outletsDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
            outletsColorLabel.text = objects?.colorName.rawValue
            outletsColorImageView.layer.cornerRadius = outletsColorImageView.frame.size.height / 2
            outletsColorImageView.layer.borderColor = UIColor.black.cgColor
            outletsColorImageView.layer.borderWidth = 1
            if objects?.colorName.rawValue == "Фиолетовый" {
                outletsColorImageView.backgroundColor = UIColor.purple
            } else if objects?.colorName.rawValue == "Чайная роза" {
                outletsColorImageView.backgroundColor = UIColor.systemPink
            } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
                outletsColorImageView.backgroundColor = UIColor.red
            } else if objects?.colorName.rawValue == "Черный" {
                outletsColorImageView.backgroundColor = UIColor.black
            } else if objects?.colorName.rawValue == "Черный/Золотой" {
                outletsColorImageView.backgroundColor = UIColor.systemYellow
            } else if objects?.colorName.rawValue == "Темно-синий" {
                outletsColorImageView.backgroundColor = UIColor.systemIndigo
            } else if objects?.colorName.rawValue == "Белый" {
                outletsColorImageView.backgroundColor = UIColor.white
                outletsColorImageView.layer.borderColor = UIColor.black.cgColor
                outletsColorImageView.layer.borderWidth = 1
            } else if objects?.colorName.rawValue == "Серый" {
                outletsColorImageView.backgroundColor = UIColor.lightGray
            } else if objects?.colorName.rawValue == "Белый/Серый" {
                outletsColorImageView.backgroundColor = UIColor.systemGray6
            } else if objects?.colorName.rawValue == "Серый/Черный" {
                outletsColorImageView.backgroundColor = UIColor.systemGray
            } else if objects?.colorName.rawValue == "Серый/Терракот" {
                outletsColorImageView.backgroundColor = UIColor.brown
            } else if objects?.colorName.rawValue == "Камуфляж" {
                outletsColorImageView.backgroundColor = UIColor.systemGreen
            } else if objects?.colorName.rawValue == "Хаки" {
                outletsColorImageView.backgroundColor = UIColor.systemGreen
            } else if objects?.colorName.rawValue == "Тёмный хаки" {
                outletsColorImageView.backgroundColor = UIColor.systemGreen
            } else if objects?.colorName.rawValue == "Оранжевый" {
                outletsColorImageView.backgroundColor = UIColor.orange
            } else if objects?.colorName.rawValue == "Черный/Красный" {
                outletsColorImageView.backgroundColor = UIColor.systemRed
        }
    
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.outletsImageView.image = image
            }
        }
    }
    
    func setColorImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.outletsColorImageView.image = image
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "PopUp" {
            let destVC = segue.destination as! SalesPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
    
    
    @IBAction func chooseSizeButton(_ sender: Any) {
        let object = self.objects
        performSegue(withIdentifier: "PopUp", sender: object)
    }
    
}

extension SalesDetailViewController: SalesPopUpViewControllerDelegate {
    
    func didChooseSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
