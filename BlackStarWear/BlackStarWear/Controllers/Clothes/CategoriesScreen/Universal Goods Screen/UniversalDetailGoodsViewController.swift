//
//  UniversalDetailGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class UniversalDetailGoodsViewController: UIViewController {

    @IBOutlet weak var universalImageView: UIImageView!
    
    @IBOutlet weak var universalPriceLabel: UILabel!
    
    @IBOutlet weak var universalNameLabel: UILabel!
    
    @IBOutlet weak var universalColorLabel: UILabel!
    
    @IBOutlet weak var universalColorImageView: UIImageView!
    
    @IBOutlet weak var universalArticulLabel: UILabel!
    
    @IBOutlet weak var universalArticulTextLabel: UILabel!
    
    @IBOutlet weak var universalDecorativeElementLabel: UILabel!
    
    @IBOutlet weak var universalDecorativeElementTextLabel: UILabel!
    
    @IBOutlet weak var universalDrawingLabel: UILabel!
    
    @IBOutlet weak var universalDrawingTextLabel: UILabel!
    
    @IBOutlet weak var universalSesonLabel: UILabel!
    
    @IBOutlet weak var universalSesonTextLabel: UILabel!
    
    @IBOutlet weak var universalCompositionLabel: UILabel!
    
    @IBOutlet weak var universalCompositionTextLabel: UILabel!
    
    @IBOutlet weak var universalMadeInLabel: UILabel!
    
    @IBOutlet weak var universalMadeInTextLabel: UILabel!
    
    @IBOutlet weak var universalLookAfterLabel: UILabel!
    
    @IBOutlet weak var universalLookAfterTextLabel: UILabel!
    
    @IBOutlet weak var universalDescriptionLabel: UILabel!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    var objects: GoodsValue?
    var checkForItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(objects!.mainImage)")
        //        setColorImage(from: "https://blackstarshop.ru/" + "\(objects!.colorImageURL)")
    }
    
    func setNavigationBar() {
        title = objects?.name
    }
    
    func setUI() {
        universalPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        universalNameLabel.text = objects?.name
        universalColorLabel.text = objects?.colorName.rawValue
        universalColorImageView.layer.cornerRadius = universalColorImageView.frame.size.height / 2
        universalColorImageView.layer.borderColor = UIColor.black.cgColor
        universalColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" {
            universalColorImageView.backgroundColor = UIColor.purple
        } else if objects?.colorName.rawValue == "Чайная роза" {
            universalColorImageView.backgroundColor = UIColor.systemPink
        } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
            universalColorImageView.backgroundColor = UIColor.red
        } else if objects?.colorName.rawValue == "Черный" {
            universalColorImageView.backgroundColor = UIColor.black
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            universalColorImageView.backgroundColor = UIColor.systemYellow
        } else if objects?.colorName.rawValue == "Темно-синий" {
            universalColorImageView.backgroundColor = UIColor.systemIndigo
        } else if objects?.colorName.rawValue == "Белый" {
            universalColorImageView.backgroundColor = UIColor.white
            universalColorImageView.layer.borderColor = UIColor.black.cgColor
            universalColorImageView.layer.borderWidth = 1
        } else if objects?.colorName.rawValue == "Серый" {
            universalColorImageView.backgroundColor = UIColor.lightGray
        } else if objects?.colorName.rawValue == "Белый/Серый" {
            universalColorImageView.backgroundColor = UIColor.systemGray6
        } else if objects?.colorName.rawValue == "Серый/Черный" {
            universalColorImageView.backgroundColor = UIColor.systemGray
        } else if objects?.colorName.rawValue == "Серый/Терракот" {
            universalColorImageView.backgroundColor = UIColor.brown
        } else if objects?.colorName.rawValue == "Камуфляж" {
            universalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Хаки" {
            universalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Тёмный хаки" {
            universalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Оранжевый" {
            universalColorImageView.backgroundColor = UIColor.orange
        } else if objects?.colorName.rawValue == "Черный/Красный" {
            universalColorImageView.backgroundColor = UIColor.systemRed
        }
        
        if checkForItem == "Ремни" {
            universalArticulTextLabel.text = objects?.article
            universalDecorativeElementTextLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
            universalDrawingTextLabel.text = objects?.attributes[1].материал?.rawValue ?? "Не указано"
            universalDrawingLabel.text = "Материал:"
            universalSesonTextLabel.text = objects?.attributes[2].рисунок?.rawValue ?? "Не указано"
            universalSesonLabel.text = "Рисунок:"
            universalCompositionTextLabel.text = objects?.attributes[3].сезон?.rawValue ?? "Не указано"
            universalCompositionLabel.text = "Сезон:"
            universalMadeInTextLabel.text = objects?.attributes[4].странаПроизводителя?.rawValue ?? "Не указано"
            universalLookAfterTextLabel.text = ""
            universalLookAfterLabel.text = ""
            universalDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
        } else if checkForItem == "Чехлы на телефоны" {
            universalArticulTextLabel.text = objects?.article
            universalDecorativeElementTextLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
            universalDrawingTextLabel.text = objects?.attributes[1].материал?.rawValue ?? "Не указано"
            universalDrawingLabel.text = "Материал:"
            universalSesonTextLabel.text = objects?.attributes[2].рисунок?.rawValue ?? "Не указано"
            universalSesonLabel.text = "Рисунок:"
            universalCompositionTextLabel.text = objects?.attributes[2].странаПроизводителя?.rawValue ?? "Не указано"
            universalCompositionLabel.text = "Страна производителя:"
//            if objects?.attributes[4].типЧехлов?.rawValue.count == 0 {
//                universalMadeInTextLabel.text = objects?.attributes[3].типЧехлов?.rawValue ?? "Не указано"
//            } else {
//                universalMadeInTextLabel.text = objects?.attributes[4].типЧехлов?.rawValue ?? "Не указано"
//            }
//            
            universalMadeInLabel.text = "Тип чехла:"
            universalLookAfterTextLabel.text = ""
            universalLookAfterLabel.text = ""
            universalDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
        } else {
            universalArticulTextLabel.text = objects?.article
            universalDecorativeElementTextLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
            universalDrawingTextLabel.text = objects?.attributes[1].рисунок?.rawValue ?? "Не указано"
            universalSesonTextLabel.text = objects?.attributes[2].сезон?.rawValue ?? "Не указано"
            universalCompositionTextLabel.text = objects?.attributes[0].состав?.rawValue ?? "Не указано"
            universalMadeInTextLabel.text = objects?.attributes[0].странаПроизводителя?.rawValue ?? "Не указано"
            universalLookAfterTextLabel.text = objects?.attributes[0].уходЗаВещами?.rawValue ?? "Не указано"
            universalDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
        }
        
        
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.universalImageView.image = image
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
                self.universalColorImageView.image = image
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "PopUp" {
            let destVC = segue.destination as! UniversalDetailPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
    
    
    @IBAction func chooseSizeButton(_ sender: Any) {
        let object = self.objects
        performSegue(withIdentifier: "PopUp", sender: object)
    }
    
    
    
}

extension UniversalDetailGoodsViewController: UniversalDetailPopUpViewControllerDelegate {
    
    func didChooseSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
