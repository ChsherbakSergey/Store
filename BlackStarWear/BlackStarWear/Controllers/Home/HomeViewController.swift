//
//  HomeViewController.swift
//  BlackStarWear
//
//  Created by Sergey on 6/22/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "BSWDesign" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "BSW Design"
        }
        if segue.identifier == "LUX" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "LUX"
        }
        if segue.identifier == "BBLINES" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "BBLINES"
        }
        if segue.identifier == "LIKEE" {
            let destVC = segue.destination as! UniversalGoodsViewController
            destVC.id = sender as? Int
            destVC.titleOfNavigationBar = "Likee"
        }
    }
    
    func setNavigationBar() {
        //Set BackBarButtonItem title
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 15)!], for: UIControl.State.normal)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 16)!]
        navigationItem.title = "BLACK STAR WEAR"
    }
    
    @IBAction func bswDesignButton(_ sender: Any) {
        let data = 316
        performSegue(withIdentifier: "BSWDesign", sender: data)
    }
    
    @IBAction func luxButton(_ sender: Any) {
        let data = 313
        performSegue(withIdentifier: "LUX", sender: data)
    }
    
    @IBAction func bbLinesButton(_ sender: Any) {
        let data = 317
        performSegue(withIdentifier: "BBLINES", sender: data)
    }
    
    @IBAction func likeeButton(_ sender: Any) {
        let data = 319
        performSegue(withIdentifier: "LIKEE", sender: data)
    }
    
    @IBAction func menCategoryButton(_ sender: Any) {
        performSegue(withIdentifier: "MenCategory", sender: nil)
    }
    
    @IBAction func womenCategoryButton(_ sender: Any) {
        performSegue(withIdentifier: "WomenCategory", sender: nil)
    }
    
    @IBAction func childrenCategoryButton(_ sender: Any) {
        performSegue(withIdentifier: "ChildrenCategory", sender: nil)
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
