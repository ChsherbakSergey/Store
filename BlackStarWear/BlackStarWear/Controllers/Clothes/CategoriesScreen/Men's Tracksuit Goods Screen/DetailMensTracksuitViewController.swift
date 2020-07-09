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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setImage(from: "https://blackstarshop.ru/" + "\(tracksuitData[2])")
    }
    
    func setUI() {
        menDetailTracksuitNameLabel.text = tracksuitData[0]
        menDetailTracksuitPriceLabel.text = String(tracksuitData[1].dropLast(5)) + " руб."
        menDetailTracksuitColorLabel.text = tracksuitData[3]
        if tracksuitData[3] == "Черный" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.black
        } else if tracksuitData[3] == "Красный" || tracksuitData[3] == "Бордовый" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.red
        } else if tracksuitData[3] == "Черный/Золотой" {
            menDetailTracksuitColorImageView.backgroundColor = UIColor.systemYellow
        }
        
        menDetailTracksuitColorImageView.layer.cornerRadius = menDetailTracksuitColorImageView.frame.size.height / 2
        menDetailTracksuitArticulLabel.text = tracksuitData[4]
        menDetailTracksuitDecorativeElementLabel.text = tracksuitData[5]
        menDetailTracksuitDrawingLabel.text = tracksuitData[6]
        menDetailTracksuitSesonLabel.text = tracksuitData[7]
        menDetailTracksuitCompositionLabel.text = tracksuitData[8]
        menDetailTracksuitMadeInLabel.text = tracksuitData[9]
        menDetailTracksuitLookAfterLabel.text = tracksuitData[10]
        menDetailTracksuitDescriptionLabel.text = tracksuitData[11]
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

    
    
}
