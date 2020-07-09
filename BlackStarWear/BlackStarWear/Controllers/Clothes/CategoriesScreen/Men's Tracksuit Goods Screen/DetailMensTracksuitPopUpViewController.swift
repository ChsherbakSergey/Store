//
//  DetailMensTracksuitPopUpViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/9/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class DetailMensTracksuitPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}
