//
//  ProfileViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var informationTableView: UITableView!
    
    @IBOutlet var popUpPhoneView: UIView!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    var effect: UIVisualEffect!
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var titles: [InformationCellData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //Call function to create titles and assign delegate and dataSource delegate to tableView
        titles = createTitlesArray()
        informationTableView.delegate = self
        informationTableView.dataSource = self
        //Working with blur effect to create PhonePopUp
        blurEffect.isHidden = true
        //Call func to design buttons (numberButton and cancelButton) in PhonePopUpView
        setupDesignForButtonInPhonePopUpView()
        popUpPhoneView.backgroundColor = .clear
    }
    
    //Create a function to design buttons (numberButton and cancelButton) in PhonePopUpView
    func setupDesignForButtonInPhonePopUpView() {
        numberButton.layer.cornerRadius = numberButton.frame.size.height / 2
        cancelButton.layer.cornerRadius = numberButton.frame.size.height / 2
    }
    
    //Create a func to display a popUp when Phone Bar Button Item is pressed
    func animatePhonePopUpIn() {
        self.view.addSubview(popUpPhoneView)
        popUpPhoneView.center = self.view.center
        popUpPhoneView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpPhoneView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.blurEffect.isHidden = false
            self.popUpPhoneView.alpha = 1
            self.popUpPhoneView.transform = CGAffineTransform.identity
        }
    }
    
    //Create a func to erase a popUp when Cancel Button in PhonePopUpView is pressed
    func animatePhonePopUpOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpPhoneView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.popUpPhoneView.alpha = 0
            self.blurEffect.isHidden = true
        }) { (_) in
            self.popUpPhoneView.removeFromSuperview()
        }
    }
    
    //func that returns an array with all titles that we need
    func createTitlesArray() -> [InformationCellData] {
        var tempTitles: [InformationCellData] = []
        let title1 = InformationCellData(title: "Отследить заказ")
        let title2 = InformationCellData(title: "Доставка")
        let title3 = InformationCellData(title: "Возврат")
        let title4 = InformationCellData(title: "Оферта")
        let title5 = InformationCellData(title: "Магазины")
        let title6 = InformationCellData(title: "Подарочные сертификаты")
        
        tempTitles.append(title1)
        tempTitles.append(title2)
        tempTitles.append(title3)
        tempTitles.append(title4)
        tempTitles.append(title5)
        tempTitles.append(title6)
        
        return tempTitles
    }
    
    @IBAction func phoneBarButtonItemPressed(_ sender: Any) {
        animatePhonePopUpIn()
    }
    
    @IBAction func popUpCancelButtonPressed(_ sender: Any) {
        animatePhonePopUpOut()
    }
    
    
    @IBAction func contactUsButtonIsPressed(_ sender: Any) {
        animatePhonePopUpIn()
    }
    
    @IBAction func vkButton(_ sender: Any) {
        showSafariVC(for: "https://vk.com/blackstarwear")
    }
    
    @IBAction func facebookButton(_ sender: Any) {
        showSafariVC(for: "https://www.facebook.com/blackstarwear/")
    }
    
    @IBAction func instagramButton(_ sender: Any) {
        showSafariVC(for: "https://www.instagram.com/blackstarwear/?hl=ru")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            //Show an invalid URL Alert
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        } else if indexPath.row == 1 {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        } else if indexPath.row == 2 {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Return") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        } else if indexPath.row == 3 {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Oferta") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        } else if indexPath.row == 4 {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Stores") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        } else {
            let title = titles[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Certificate") as! InformationTableViewCell
            cell.setTitle(title: title)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
