//
//  DetailMensTracksuitPopUpViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/9/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

protocol DetailMensTracksuitPopUpViewControllerDelegate {
    func didChooseMensTracksuitSize(size: String)
}

class DetailMensTracksuitPopUpViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sizeDelegate: DetailMensTracksuitPopUpViewControllerDelegate?
    
    var objects: GoodsValue?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension DetailMensTracksuitPopUpViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.offers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let size = objects?.offers[indexPath.row].size.rawValue
        let quantity = objects?.offers[indexPath.row].quantity
        let cell = tableView.dequeueReusableCell(withIdentifier: "SizeAndQuantity") as! MensTracksuitDetailPopUpTableViewCell
        cell.sizeLabel.text = size
        cell.quantityLabel.text = "\(quantity ?? "0") шт."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = objects?.offers[indexPath.row].size.rawValue
        sizeDelegate?.didChooseMensTracksuitSize(size: data ?? "Размер не выбран")
        dismiss(animated: true, completion: nil)
    }
    
}
