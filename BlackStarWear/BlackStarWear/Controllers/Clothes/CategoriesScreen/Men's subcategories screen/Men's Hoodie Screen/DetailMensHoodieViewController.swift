//
//  DetailMensHoodieViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class DetailMensHoodieViewController: UIViewController {
    
    @IBOutlet weak var mensHoodieImageView: UIImageView!
    
    @IBOutlet weak var mensHoodiePriceLabel: UILabel!
    
    @IBOutlet weak var mensHoodieNameLabel: UILabel!
    
    @IBOutlet weak var mensHoodieColorLabel: UILabel!
    
    @IBOutlet weak var mensHoodieColorImageView: UIImageView!
    
    @IBOutlet weak var mensHoodieArticulLabel: UILabel!
    
    @IBOutlet weak var mensHoodieDecorativeElementLabel: UILabel!
    
    @IBOutlet weak var mensHoodieDrawingLabel: UILabel!
    
    @IBOutlet weak var mensHoodieSesonLabel: UILabel!
    
    @IBOutlet weak var mensHoodieCompositionLabel: UILabel!
    
    @IBOutlet weak var mensHoodieMadeIn: UILabel!
    
    @IBOutlet weak var mensHoodieLookAfterLabel: UILabel!
    
    @IBOutlet weak var mensHoodieDescriptionLabel: UILabel!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    
    var objects: GoodsValue?
    
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
        mensHoodiePriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        mensHoodieNameLabel.text = objects?.name
        mensHoodieColorLabel.text = objects?.colorName.rawValue
        mensHoodieColorImageView.layer.cornerRadius = mensHoodieColorImageView.frame.size.height / 2
        mensHoodieColorImageView.layer.borderColor = UIColor.black.cgColor
        mensHoodieColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" {
            mensHoodieColorImageView.backgroundColor = UIColor.purple
        } else if objects?.colorName.rawValue == "Чайная роза" {
            mensHoodieColorImageView.backgroundColor = UIColor.systemPink
        } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
            mensHoodieColorImageView.backgroundColor = UIColor.red
        } else if objects?.colorName.rawValue == "Черный" {
            mensHoodieColorImageView.backgroundColor = UIColor.black
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            mensHoodieColorImageView.backgroundColor = UIColor.systemYellow
        } else if objects?.colorName.rawValue == "Темно-синий" {
            mensHoodieColorImageView.backgroundColor = UIColor.systemIndigo
        } else if objects?.colorName.rawValue == "Белый" {
            mensHoodieColorImageView.backgroundColor = UIColor.white
            mensHoodieColorImageView.layer.borderColor = UIColor.black.cgColor
            mensHoodieColorImageView.layer.borderWidth = 1
        } else if objects?.colorName.rawValue == "Серый" {
            mensHoodieColorImageView.backgroundColor = UIColor.lightGray
        } else if objects?.colorName.rawValue == "Белый/Серый" {
            mensHoodieColorImageView.backgroundColor = UIColor.systemGray6
        } else if objects?.colorName.rawValue == "Серый/Черный" {
            mensHoodieColorImageView.backgroundColor = UIColor.systemGray
        } else if objects?.colorName.rawValue == "Серый/Терракот" {
            mensHoodieColorImageView.backgroundColor = UIColor.brown
        }
        
        mensHoodieArticulLabel.text = objects?.article
        mensHoodieDecorativeElementLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
        mensHoodieDrawingLabel.text = objects?.attributes[1].рисунок?.rawValue ?? "Не указано"
        mensHoodieSesonLabel.text = objects?.attributes[2].сезон?.rawValue ?? "Не указано"
        mensHoodieCompositionLabel.text = objects?.attributes[3].состав?.rawValue ?? "Не указано"
        mensHoodieMadeIn.text = objects?.attributes[4].странаПроизводителя?.rawValue ?? "Не указано"
        mensHoodieLookAfterLabel.text = objects?.attributes[4].уходЗаВещами?.rawValue ?? "Не указано"
        mensHoodieDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.mensHoodieImageView.image = image
            }
        }
    }
    
    @IBAction func chooseSizeButton(_ sender: Any) {
        let object = self.objects
        performSegue(withIdentifier: "PopUp", sender: object)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "PopUp" {
            let destVC = segue.destination as! MensHoodieDetailPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
}

extension DetailMensHoodieViewController: MensHoodieDetailPopUpViewControllerDelegate {
    
    func didChooseMensHoodieSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
