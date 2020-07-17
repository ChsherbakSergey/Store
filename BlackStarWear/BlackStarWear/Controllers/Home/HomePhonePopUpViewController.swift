//
//  HomePhonePopUpViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/17/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class HomePhonePopUpViewController: UIViewController {

    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var callButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        cancelButtonOutlet.layer.cornerRadius = 12
        callButtonOutlet.layer.cornerRadius = 12
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}
