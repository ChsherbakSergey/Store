//
//  TestViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/18/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var objects: GoodsValue?
    var titleOfGoods: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects?.attributes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let decorativeElement = objects?.attributes[indexPath.row].декоративныйЭлемент?.rawValue
        let drawing = objects?.attributes[indexPath.row].рисунок?.rawValue
        let seson = objects?.attributes[indexPath.row].сезон?.rawValue
        let composition = objects?.attributes[indexPath.row].состав?.rawValue
        let madeIN = objects?.attributes[indexPath.row].странаПроизводителя?.rawValue
        let lookAfter = objects?.attributes[indexPath.row].уходЗаВещами?.rawValue
        let material = objects?.attributes[indexPath.row].материал?.rawValue
        let typeOfCase = objects?.attributes[indexPath.row].типЧехлов?.rawValue
        if objects?.attributes.count == 6 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Сезон: "
                cell.descriptionLabel.text = seson
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Состав: "
                cell.descriptionLabel.text = composition
                return cell
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна производителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Уход за вещами: "
                cell.descriptionLabel.text = lookAfter
                return cell
            }
            
        } else if objects?.attributes.count == 5 && titleOfGoods?.contains("Чехол") == true {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Материал: "
                cell.descriptionLabel.text = material
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна производителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Тип чехлов: "
                cell.descriptionLabel.text = typeOfCase
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                return cell
            }

        } else if objects?.attributes.count == 5 && titleOfGoods?.contains("Ремень") == true {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Материал: "
                cell.descriptionLabel.text = material
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Сезон: "
                cell.descriptionLabel.text = seson
                return cell
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна проихводителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                return cell
            }

        }else if objects?.attributes.count == 5 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Сезон: "
                cell.descriptionLabel.text = seson
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Состав: "
                cell.descriptionLabel.text = composition
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна производителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            }
            
        } else if objects?.attributes.count == 4 && titleOfGoods?.contains("Чехол") == true {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Сезон: "
                cell.descriptionLabel.text = seson
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна производителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                return cell
            }

        } else if objects?.attributes.count == 4 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Декоративный элемент: "
                cell.descriptionLabel.text = decorativeElement
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Рисунок: "
                cell.descriptionLabel.text = drawing
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Сезон: "
                cell.descriptionLabel.text = seson
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Состав: "
                cell.descriptionLabel.text = composition
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
                cell.nameLabel.text = "Страна производителя: "
                cell.descriptionLabel.text = madeIN
                return cell
            }
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DecorativeElement") as! TestTableViewCell
            cell.nameLabel.text = "Уход за вещами: "
            cell.descriptionLabel.text = lookAfter
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
}
