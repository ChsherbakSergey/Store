//
//  MensTshirtDetailPopUpViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 7/11/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

protocol MensTshirtDetailPopUpViewControllerDelegate {
    func didTapSize(size: String)
}

class MensTshirtDetailPopUpViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sizeDelegate: MensTshirtDetailPopUpViewControllerDelegate?
    
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

extension MensTshirtDetailPopUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.offers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let size = objects?.offers[indexPath.row].size.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: "SizeAndQuantity") as! MensTshirtPopUpTableViewCell
        cell.sizeLabel.text = size
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = objects?.offers[indexPath.row].size.rawValue
        sizeDelegate?.didTapSize(size: data ?? "Размер не выбран")
        dismiss(animated: true, completion: nil)
    }
    
}
