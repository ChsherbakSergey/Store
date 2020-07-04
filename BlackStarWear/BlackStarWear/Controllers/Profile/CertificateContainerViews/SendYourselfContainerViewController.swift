//
//  SendYourselfContainerViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/26/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class SendYourselfContainerViewController: UIViewController {
    
    @IBOutlet weak var sendNowButton: UIButton!
    @IBOutlet weak var chooseDateButton: UIButton!
    @IBOutlet weak var payView: UIView!
    @IBOutlet weak var payButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendNowButton.layer.borderWidth = 1
        sendNowButton.layer.borderColor = UIColor.black.cgColor
        sendNowButton.layer.cornerRadius = 5
        sendNowButton.backgroundColor = .white
        chooseDateButton.layer.cornerRadius = 5
        payView.layer.cornerRadius = 10
        payButton.layer.cornerRadius = 5
    }
    
    @IBAction func sendNowButtonIsPressed(_ sender: Any) {
        sendNowButton.layer.borderWidth = 1
        sendNowButton.layer.borderColor = UIColor.black.cgColor
        sendNowButton.backgroundColor = .white
        chooseDateButton.layer.borderWidth = 0
        chooseDateButton.layer.borderColor = UIColor.clear.cgColor
        chooseDateButton.backgroundColor = .systemGray6
    }
    
    @IBAction func chooseDateButtonIsPressed(_ sender: Any) {
        sendNowButton.layer.borderWidth = 0
        sendNowButton.layer.borderColor = UIColor.clear.cgColor
        sendNowButton.backgroundColor = .systemGray6
        chooseDateButton.layer.borderWidth = 1
        chooseDateButton.layer.borderColor = UIColor.black.cgColor
        chooseDateButton.backgroundColor = .white
    }
    

}
