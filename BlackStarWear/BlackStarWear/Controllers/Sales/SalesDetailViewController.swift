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
    
    @IBOutlet weak var outletsDescriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var objects: GoodsValue?
    var checkForItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewHight()
        tableView.delegate = self
        tableView.dataSource = self
        setNavigationBar()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(objects!.mainImage)")
    }
    
    func setTableViewHight() {
        let height = objects!.attributes.count * 17
        tableViewHeightConstraint.constant = CGFloat(height)
    }

    func setNavigationBar() {
        title = objects?.name.replacingOccurrences(of: "amp;", with: "")
    }
    
    func setUI() {
            outletsTagLabel.text = objects?.tag
            outletsArticulLabel.text = objects?.article ?? "Не указан"
            outletsPriceLabel.text = String(objects?.price.dropLast(5) ?? "0") + " руб."
            outletsNameLabel.text = objects?.name.replacingOccurrences(of: "BS&amp;", with: " ")
            let outletsOldPriceStrikeThrough = String(objects?.oldPrice?.dropLast(5) ?? "0") + " руб."
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: outletsOldPriceStrikeThrough )
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            outletsOldPriceLabel.attributedText = attributeString
            outletsDescriptionLabel.text = objects?.goodsDescription.replacingOccurrences(of: "&nbsp;", with: "") ?? "Не указано"
            outletsColorLabel.text = objects?.colorName.rawValue
            outletsColorImageView.layer.cornerRadius = outletsColorImageView.frame.size.height / 2
            outletsColorImageView.layer.borderColor = UIColor.black.cgColor
            outletsColorImageView.layer.borderWidth = 1
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
                outletsColorImageView.backgroundColor = UIColor.systemGray6
            } else if objects?.colorName.rawValue == "Серый/Черный" {
                setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/black-grey.jpg")
            } else if objects?.colorName.rawValue == "Серый/Терракот" {
                outletsColorImageView.backgroundColor = UIColor.brown
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
                outletsColorImageView.backgroundColor = UIColor.gray
            } else if objects?.colorName.rawValue == "Прозрачный" {
                setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/pusto.png")
            } else if objects?.colorName.rawValue == "Молочный" {
                setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/milk_f8f3ed.jpg")
            } else if objects?.colorName.rawValue == "Светло-розовый" {
                setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/pale-pink_ffd1dc.jpg")
            } else if objects?.colorName.rawValue == "Экрю" {
                setColorImage(from: "https://blackstarshop.ru/" + "image/catalog/style/color/milk_f8f3ed.jpg")
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
    
    @IBAction func addInShoppingBagButton(_ sender: Any) {
        if chooseSizeButtonOutlet.titleLabel?.text == "Выбрать размер" {
                    let object = self.objects
                    performSegue(withIdentifier: "PopUp", sender: object)
                } else {
                    Persisitance.shared.productName.append((objects?.name.replacingOccurrences(of: "amp;", with: ""))!)
                    Persisitance.shared.productSize.append((chooseSizeButtonOutlet.titleLabel?.text)!)
                    Persisitance.shared.productPrice.append(String(objects!.price.dropLast(5)) + " руб.")
                    Persisitance.shared.productImage.append("https://blackstarshop.ru/" + "\(objects!.mainImage)")
        //            Persisitance.shared.productImage.removeAll()
        //            Persisitance.shared.productName.removeAll()
        //            Persisitance.shared.productPrice.removeAll()
        //            Persisitance.shared.productSize.removeAll()
                    
//                    print(Persisitance.shared.productName)
//                    print(Persisitance.shared.productSize)
//                    print(Persisitance.shared.productPrice)
//                    print(Persisitance.shared.productImage)
                }
    }
    
}

extension SalesDetailViewController: SalesPopUpViewControllerDelegate {
    
    func didChooseSize(size: String) {
        chooseSizeButtonOutlet.setTitle("Размер: " + size, for: .normal)
    }
    
}


extension SalesDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects?.attributes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (name, attribute) = objects?.attributes[indexPath.row].getAttribute() ?? ("", "")
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesAttributes") as! SalesAttributesTableViewCell
        cell.nameLabel.text = name
        cell.descriptionLabel.text = attribute
        cell.selectionStyle = .none
        return cell
    }
    
}


