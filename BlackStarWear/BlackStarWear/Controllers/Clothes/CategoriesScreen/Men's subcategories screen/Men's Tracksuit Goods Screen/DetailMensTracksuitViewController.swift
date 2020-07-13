//
//  DetailMensTracksuitViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/9/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class DetailMensTracksuitViewController: UIViewController {

    var tracksuitData: [String] = []
    
    @IBOutlet weak var menDetailTracksuitImageView: UIImageView!
    
    @IBOutlet weak var menDetailTracksuitPriceLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitNameLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitColorLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitColorImageView: UIImageView!
    
    @IBOutlet weak var menDetailTracksuitArticulLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitDecorativeElementLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitDrawingLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitSesonLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitCompositionLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitMadeInLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitLookAfterLabel: UILabel!
    
    @IBOutlet weak var menDetailTracksuitDescriptionLabel: UILabel!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    
    var objects: GoodsValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(objects!.mainImage)")
    }
    
    func setUI() {
        menDetailTracksuitPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        menDetailTracksuitNameLabel.text = objects?.name
        menDetailTracksuitColorLabel.text = objects?.colorName.rawValue
        menDetailTracksuitColorImageView.layer.cornerRadius = menDetailTracksuitColorImageView.frame.size.height / 2
        menDetailTracksuitColorImageView.layer.borderColor = UIColor.black.cgColor
        menDetailTracksuitColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.purple
        } else if objects?.colorName.rawValue == "Чайная роза" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemPink
        } else if objects?.colorName.rawValue == "Бордовый" || objects?.colorName.rawValue == "Красный" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.red
        } else if objects?.colorName.rawValue == "Черный" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.black
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemYellow
        } else if objects?.colorName.rawValue == "Темно-синий" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemIndigo
        } else if objects?.colorName.rawValue == "Белый" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.white
            menDetailTracksuitColorImageView.layer.borderColor = UIColor.black.cgColor
            menDetailTracksuitColorImageView.layer.borderWidth = 1
        } else if objects?.colorName.rawValue == "Серый" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.lightGray
        } else if objects?.colorName.rawValue == "Белый/Серый" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemGray6
        } else if objects?.colorName.rawValue == "Серый/Черный" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemGray
        } else if objects?.colorName.rawValue == "Серый/Терракот" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.brown
        }
        
        menDetailTracksuitArticulLabel.text = objects?.article
        menDetailTracksuitDecorativeElementLabel.text = objects?.attributes[0].декоративныйЭлемент?.rawValue ?? "Не указано"
        menDetailTracksuitDrawingLabel.text = objects?.attributes[1].рисунок?.rawValue ?? "Не указано"
        menDetailTracksuitSesonLabel.text = objects?.attributes[2].сезон?.rawValue ?? "Не указано"
        menDetailTracksuitCompositionLabel.text = objects?.attributes[3].состав?.rawValue ?? "Не указано"
        menDetailTracksuitMadeInLabel.text = objects?.attributes[4].странаПроизводителя?.rawValue ?? "Не указано"
        menDetailTracksuitLookAfterLabel.text = objects?.attributes[4].уходЗаВещами?.rawValue ?? "Не указано"
        menDetailTracksuitDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
    }

    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.menDetailTracksuitImageView.image = image
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
            let destVC = segue.destination as! DetailMensTracksuitPopUpViewController
            destVC.objects = sender as? GoodsValue
            destVC.sizeDelegate = self
        }
    }
}

extension DetailMensTracksuitViewController: DetailMensTracksuitPopUpViewControllerDelegate {
    
    func didChooseMensTracksuitSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}
