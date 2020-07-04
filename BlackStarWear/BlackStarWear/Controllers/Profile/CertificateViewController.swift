//
//  CertificateViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/26/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class CertificateViewController: UIViewController {

    //IBOutlets
    
    @IBOutlet weak var blackStarView: UIView!
    
    @IBOutlet weak var nominalTextField: UITextField!
    
    let nominal = ["500₽", "1000₽", "1500₽", "2000₽", "3000₽", "5000₽", "10000₽", "20000₽"]
    var selectedNominal: String?
    
    @IBOutlet weak var quantityTextField: UITextField!
    var quantity = 1
    
    @IBOutlet weak var sendAsAGiftButton: UIButton!
    @IBOutlet weak var sendYourselfButton: UIButton!
    @IBOutlet weak var sendAsATestButton: UIButton!
    
    
    @IBOutlet weak var sendAsAGiftContainerView: UIView!
    @IBOutlet weak var sendYourselfContainerView: UIView!
    @IBOutlet weak var sendAsATestContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Design blackStarView
        blackStarView.layer.cornerRadius = 10
        //Call UIPicketView
        createPickerView()
        //Call ToolBar for UIPickerView
        createToolBarForPickerView()
        //Assign initial value to quantityTextField
        quantityTextField.text = String(quantity)
        //Design SendCertificates Buttons
        sendAsAGiftButton.backgroundColor = .white
        sendAsAGiftButton.layer.cornerRadius = 5
        sendAsAGiftButton.layer.borderWidth = 1
        sendAsAGiftButton.layer.borderColor = UIColor.black.cgColor
        sendYourselfButton.layer.cornerRadius = 5
        sendAsATestButton.layer.cornerRadius = 5
        //Assign initial containerView
        sendAsAGiftContainerView.isHidden = false
        sendYourselfContainerView.isHidden = true
        sendAsATestContainerView.isHidden = true
    }
    
    //Creating PickerView
    func createPickerView() {
        let nominalPicker = UIPickerView()
        nominalPicker.delegate = self
        nominalTextField.inputView = nominalPicker
        
    }
    
    func createToolBarForPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.tintColor = .black
        
        let doneButton = UIBarButtonItem(title: "Выбрать", style: .plain, target: self, action: #selector(CertificateViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        nominalTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func minusQuantityButton(_ sender: Any) {
        if quantity <= 0 {
            return
        } else {
            quantity -= 1
            quantityTextField.text = String(quantity)
        }
    }
    
    @IBAction func plusQuantityButton(_ sender: Any) {
        if quantity >= 10 {
            return
        } else {
            quantity += 1
            quantityTextField.text = String(quantity)
        }
    }
    
    @IBAction func sendAsAGiftButtonIsPressed(_ sender: Any) {
        sendAsAGiftButton.backgroundColor = .white
        sendAsAGiftButton.layer.borderWidth = 1
        sendAsAGiftButton.layer.borderColor = UIColor.black.cgColor
        sendYourselfButton.backgroundColor = .systemGray6
        sendYourselfButton.layer.borderWidth = 0
        sendYourselfButton.layer.borderColor = UIColor.clear.cgColor
        sendAsATestButton.backgroundColor = .systemGray6
        sendAsATestButton.layer.borderWidth = 0
        sendAsATestButton.layer.borderColor = UIColor.clear.cgColor
        
        sendAsAGiftContainerView.isHidden = false
        sendYourselfContainerView.isHidden = true
        sendAsATestContainerView.isHidden = true
    }
    
    @IBAction func sendYourselfButtonIsPressed(_ sender: Any) {
        sendAsAGiftButton.backgroundColor = .systemGray6
        sendAsAGiftButton.layer.borderWidth = 0
        sendAsAGiftButton.layer.borderColor = UIColor.clear.cgColor
        sendYourselfButton.backgroundColor = .white
        sendYourselfButton.layer.borderWidth = 1
        sendYourselfButton.layer.borderColor = UIColor.black.cgColor
        sendAsATestButton.backgroundColor = .systemGray6
        sendAsATestButton.layer.borderWidth = 0
        sendAsATestButton.layer.borderColor = UIColor.clear.cgColor
        
        sendAsAGiftContainerView.isHidden = true
        sendYourselfContainerView.isHidden = false
        sendAsATestContainerView.isHidden = true
    }
    
    @IBAction func sendAsATestButtonIsPressed(_ sender: Any) {
        sendAsAGiftButton.backgroundColor = .systemGray6
        sendAsAGiftButton.layer.borderWidth = 0
        sendAsAGiftButton.layer.borderColor = UIColor.clear.cgColor
        sendYourselfButton.backgroundColor = .systemGray6
        sendYourselfButton.layer.borderWidth = 0
        sendYourselfButton.layer.borderColor = UIColor.clear.cgColor
        sendAsATestButton.backgroundColor = .white
        sendAsATestButton.layer.borderWidth = 1
        sendAsATestButton.layer.borderColor = UIColor.black.cgColor
        
        sendAsAGiftContainerView.isHidden = true
        sendYourselfContainerView.isHidden = true
        sendAsATestContainerView.isHidden = false
    }
    
}

extension CertificateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nominal.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nominal[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNominal = nominal[row]
        nominalTextField.text = selectedNominal
    }
    
}
