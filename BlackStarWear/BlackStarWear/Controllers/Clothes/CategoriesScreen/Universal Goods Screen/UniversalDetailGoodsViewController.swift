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
    
    @IBOutlet weak var universalDescriptionLabel: UILabel!
    
    @IBOutlet weak var chooseSizeButtonOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var objects: GoodsValue?
    var checkForItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setTableViewHight()
        setNavigationBar()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(objects!.mainImage)")
        //        setColorImage(from: "https://blackstarshop.ru/" + "\(objects!.colorImageURL)")
    }
    
    func setTableViewHight() {
        let height = objects!.attributes.count * 17
        tableViewHeightConstraint.constant = CGFloat(height)
    }
    
    func setNavigationBar() {
        title = objects?.name.replacingOccurrences(of: "amp;", with: "")
    }
    
    func setUI() {
        universalArticulTextLabel.text = objects?.article
        universalDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: " ")
        universalPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
        universalNameLabel.text = objects?.name.replacingOccurrences(of: "amp;", with: "")
        universalColorLabel.text = objects?.colorName.rawValue
        universalColorImageView.layer.cornerRadius = universalColorImageView.frame.size.height / 2
        universalColorImageView.layer.borderColor = UIColor.black.cgColor
        universalColorImageView.layer.borderWidth = 1
        if objects?.colorName.rawValue == "Фиолетовый" || objects?.colorName.rawValue == "Сиреневый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/purple.jpg")
        } else if objects?.colorName.rawValue == "Чайная роза" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/vinous.jpg")
        } else if objects?.colorName.rawValue == "Красный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/red_ff0000.jpg")
        } else if objects?.colorName.rawValue == "Черный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black_000000.jpg")
        } else if objects?.colorName.rawValue == "Бордовый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/vinous.jpg")
        } else if objects?.colorName.rawValue == "Черный/Золотой" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black-gold.jpg")
        } else if objects?.colorName.rawValue == "Темно-синий" || objects?.colorName.rawValue == "Cиний"  {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/blue_0000ff.jpg")
        } else if objects?.colorName.rawValue == "Белый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/white.gif")
        } else if objects?.colorName.rawValue == "Серый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/grey_838383.jpg")
        } else if objects?.colorName.rawValue == "Белый/Серый" {
            universalColorImageView.backgroundColor = UIColor.systemGray6
        } else if objects?.colorName.rawValue == "Серый/Черный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black-grey.jpg")
        } else if objects?.colorName.rawValue == "Серый/Терракот" {
            universalColorImageView.backgroundColor = UIColor.brown
        } else if objects?.colorName.rawValue == "Камуфляж" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/camouflage.jpg")
        } else if objects?.colorName.rawValue == "Хаки" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/khaki_c3b091.jpg")
        } else if objects?.colorName.rawValue == "Тёмный хаки" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/khaki_c3b091.jpg")
        } else if objects?.colorName.rawValue == "Оранжевый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/orange-ffa500.png")
        } else if objects?.colorName.rawValue == "Черный/Красный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black_red_000000.jpg")
        } else if objects?.colorName.rawValue == "Розовый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/lightpink.jpg")
        } else if objects?.colorName.rawValue == "Бежевый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/beige_F5F5DC.jpg")
        } else if objects?.colorName.rawValue == "Серый меланж" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/gray_melange_dbd6dc.jpg")
        } else if objects?.colorName.rawValue == "Лаймовый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/lime_00ff00.png")
        } else if objects?.colorName.rawValue == "Желтый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/yellow_ffff00.jpg")
        } else if objects?.colorName.rawValue == "Черный/Камуфляж" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black-cam.jpg")
        } else if objects?.colorName.rawValue == "Темно-серый" || objects?.colorName.rawValue == "Серый/Терракот" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/dark_gray_melange_60606d.jpg")
        } else if objects?.colorName.rawValue == "Коричневый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/brown_964b00.jpg")
        } else if objects?.colorName.rawValue == "Золотой" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/gold.jpg")
        } else if objects?.colorName.rawValue == "Черный/Белый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black_white_000fff.jpg")
        } else if objects?.colorName.rawValue == "Серебряный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/serebro.jpg")
        } else if objects?.colorName.rawValue == "Зеленый" || objects?.colorName.rawValue == "Темно-зеленый" || objects?.colorName.rawValue == "Изумрудный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/green_008000.jpg")
        } else if objects?.colorName.rawValue == "Персиковый" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/persik.jpg")
        } else if objects?.colorName.rawValue == "Антрацит меланж" {
            universalColorImageView.backgroundColor = UIColor.gray
        } else if objects?.colorName.rawValue == "Прозрачный" {
            setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/pusto.png")
        }
    
//        case серыйСиний = "Серый/Синий"
//        case черныйФиолетовый = "Черный/Фиолетовый"
//        case черныйСалатовый = "Черный/Салатовый"
//        case черныйЖелтый = "Черный/Желтый"
//        case черныйБирюзовый = "Черный/Бирюзовый"
//        case мультиколор = "Мультиколор"
//        case черныйСеребряный = "Черный/Серебряный"
//        case градиент = "Градиент"
//        case коричневыйГрадиент = "Коричневый градиент"
        
        
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

extension UniversalDetailGoodsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects?.attributes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (name, attribute) = objects?.attributes[indexPath.row].getAttribute() ?? ("", "")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Attributes") as! AttributesTableViewCell
        cell.nameLabel.text = name
        cell.descriptionLabel.text = attribute
        cell.selectionStyle = .none
        return cell
    }
    
}
