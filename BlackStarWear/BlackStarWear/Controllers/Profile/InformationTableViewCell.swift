//
//  InformationTableViewCell.swift
//  BlackStarWear
//
//  Created by Sergey on 6/23/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet weak var InformationNameLabel: UILabel!
    
    func setTitle(title: InformationCellData) {
        InformationNameLabel.text = title.title
       }
}
