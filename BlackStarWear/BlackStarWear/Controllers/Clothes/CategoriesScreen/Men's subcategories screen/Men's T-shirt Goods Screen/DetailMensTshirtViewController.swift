//
//  DetailMensTshirtViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/11/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class DetailMensTshirtViewController: UIViewController {

    @IBOutlet weak var mensTshirtImageView: UIImageView!
    
    @IBOutlet weak var mensTshirtPriceLabel: UILabel!
    
    @IBOutlet weak var mensTshirtNameLabel: UILabel!
    
    @IBOutlet weak var mensTshirtColorLabel: UILabel!
    
    @IBOutlet weak var mensTshirtColorImageView: UIImageView!
    
    @IBOutlet weak var mensTshirtArticulLabel: UILabel!
    
    @IBOutlet weak var mensTshirtDecorativeElementLabel: UILabel!
    
    @IBOutlet weak var mensTshirtDrawingLabel: UILabel!
    
    @IBOutlet weak var mensTshirtSesonLabel: UILabel!
    
    @IBOutlet weak var mensTshirtCompositionLabel: UILabel!
    
    @IBOutlet weak var mensTshirtMadeInLabel: UILabel!
    
    @IBOutlet weak var mensTshirtLookAfterLabel: UILabel!
    
    @IBOutlet weak var mensTshirtDescriptionLabel: UILabel!
    
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
        mensTshirtPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        mensTshirtNameLabel.text = objects?.name
        mensTshirtColorLabel.text = objects?.colorName.rawValue
        mensTshirtColorImageView.layer.cornerRadius = mensTshirtColorImageView.frame.size.height / 2
        mensTshirtColorImageView.layer.borderColor = UIColor.black.cgColor
        mensTshirtColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" {
            mensTshirtColorImageView.backgroundColor = UIColor.purple
        } else if objects?.colorName.rawValue == "Чайная роза" {
            mensTshirtColorImageView.backgroundColor = UIColor.systemPink
        } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
            mensTshirtColorImageView.backgroundColor = UIColor.red
        } else if objects?.colorName.rawValue == "Черный" {
            mensTshirtColorImageView.backgroundColor = UIColor.black
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            mensTshirtColorImageView.backgroundColor = UIColor.systemYellow
        } else if objects?.colorName.rawValue == "Темно-синий" {
            mensTshirtColorImageView.backgroundColor = UIColor.systemIndigo
        } else if objects?.colorName.rawValue == "Белый" {
            mensTshirtColorImageView.backgroundColor = UIColor.white
            mensTshirtColorImageView.layer.borderColor = UIColor.black.cgColor
            mensTshirtColorImageView.layer.borderWidth = 1
        } else if objects?.colorName.rawValue == "Серый" {
            mensTshirtColorImageView.backgroundColor = UIColor.lightGray
        }
        mensTshirtArticulLabel.text = objects?.article
        mensTshirtDecorativeElementLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
        mensTshirtDrawingLabel.text = objects?.attributes[1].рисунок?.rawValue ?? "Не указано"
        mensTshirtSesonLabel.text = objects?.attributes[2].сезон?.rawValue ?? "Не указано"
        mensTshirtCompositionLabel.text = objects?.attributes[3].состав?.rawValue ?? "Не указано"
        mensTshirtMadeInLabel.text = objects?.attributes[4].странаПроизводителя?.rawValue ?? "Не указано"
        mensTshirtLookAfterLabel.text = objects?.attributes[4].уходЗаВещами?.rawValue ?? "Не указано"
        mensTshirtDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.mensTshirtImageView.image = image
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
            let destVC = segue.destination as! MensTshirtDetailPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
    
}


extension DetailMensTshirtViewController: MensTshirtDetailPopUpViewControllerDelegate {
    
    func didChooseMensTshirtSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
