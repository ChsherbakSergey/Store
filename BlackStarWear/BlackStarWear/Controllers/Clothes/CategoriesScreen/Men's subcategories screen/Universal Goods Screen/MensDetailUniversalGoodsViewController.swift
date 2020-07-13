//
//  MensDetailUniversalGoodsViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class MensDetailUniversalGoodsViewController: UIViewController {

    @IBOutlet weak var mensDetailUniversalImageView: UIImageView!
    
    @IBOutlet weak var mensDetailUniversalPriceLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalNameLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalColorLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalColorImageView: UIImageView!
    
    @IBOutlet weak var mensDetailUniversalArticulLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalDecorativeElementLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalDrawingLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalSesonLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalCompositionLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalMadeIn: UILabel!
    
    @IBOutlet weak var mensDetailUniversalLookAfterLabel: UILabel!
    
    @IBOutlet weak var mensDetailUniversalDescriptionLabel: UILabel!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    var objects: GoodsValue?
    
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
        mensDetailUniversalPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        mensDetailUniversalNameLabel.text = objects?.name
        mensDetailUniversalColorLabel.text = objects?.colorName.rawValue
        mensDetailUniversalColorImageView.layer.cornerRadius = mensDetailUniversalColorImageView.frame.size.height / 2
        mensDetailUniversalColorImageView.layer.borderColor = UIColor.black.cgColor
        mensDetailUniversalColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.purple
        } else if objects?.colorName.rawValue == "Чайная роза" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemPink
        } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.red
        } else if objects?.colorName.rawValue == "Черный" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.black
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemYellow
        } else if objects?.colorName.rawValue == "Темно-синий" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemIndigo
        } else if objects?.colorName.rawValue == "Белый" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.white
            mensDetailUniversalColorImageView.layer.borderColor = UIColor.black.cgColor
            mensDetailUniversalColorImageView.layer.borderWidth = 1
        } else if objects?.colorName.rawValue == "Серый" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.lightGray
        } else if objects?.colorName.rawValue == "Белый/Серый" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemGray6
        } else if objects?.colorName.rawValue == "Серый/Черный" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemGray
        } else if objects?.colorName.rawValue == "Серый/Терракот" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.brown
        } else if objects?.colorName.rawValue == "Камуфляж" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Хаки" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Тёмный хаки" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemGreen
        } else if objects?.colorName.rawValue == "Оранжевый" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.orange
        } else if objects?.colorName.rawValue == "Черный/Красный" {
            mensDetailUniversalColorImageView.backgroundColor = UIColor.systemRed
        }
        
        mensDetailUniversalArticulLabel.text = objects?.article
        mensDetailUniversalDecorativeElementLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
        mensDetailUniversalDrawingLabel.text = objects?.attributes[1].рисунок?.rawValue ?? "Не указано"
        mensDetailUniversalSesonLabel.text = objects?.attributes[2].сезон?.rawValue ?? "Не указано"
        mensDetailUniversalCompositionLabel.text = objects?.attributes[3].состав?.rawValue ?? "Не указано"
        mensDetailUniversalMadeIn.text = objects?.attributes[4].странаПроизводителя?.rawValue ?? "Не указано"
        mensDetailUniversalLookAfterLabel.text = objects?.attributes[4].уходЗаВещами?.rawValue ?? "Не указано"
        mensDetailUniversalDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.mensDetailUniversalImageView.image = image
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
                self.mensDetailUniversalColorImageView.image = image
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "PopUp" {
            let destVC = segue.destination as! MensUniversalDetailPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
    

    @IBAction func chooseSizeButton(_ sender: Any) {
        let object = self.objects
        performSegue(withIdentifier: "PopUp", sender: object)
    }

}

extension MensDetailUniversalGoodsViewController: MensUniversalDetailPopUpViewControllerDelegate {
    
    func didChooseMensSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
