//
//  ViewController.swift
//  Counter
//
//  Created by Сомов Кирилл on 01.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var counterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonTapped() {
        if let oldValue = Int(counterLabel.text ?? "") {
            let newValue = oldValue + 1
            counterLabel.text = String(newValue)
            print("\(oldValue) changed to \(newValue)")
        } else {
            print("There was a problem with unwrapping text")
        }
    }
}

