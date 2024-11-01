//
//  ViewController.swift
//  Counter
//
//  Created by Сомов Кирилл on 01.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Counter: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var currentCounterValue = 0 {
        didSet {
            Counter.text = String(currentCounterValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        textViewSetup()
    }
    
    
    func buttonSetup() {
        minusButton.tintColor = .systemBlue
        plusButton.tintColor = .systemRed
        clearButton.tintColor = .systemGray
    }
    
    
    func textViewSetup() {
        historyTextView.text.append("История изменений\n")
    }
    
    
    func createLog(situation: String) {
        var log = ""
        
        switch situation {
        case "plus":
            log = "\(Date().normalizeDate()): значение изменено на +1\n"
        case "minus_success":
            log = "\(Date().normalizeDate()): значение изменено на -1\n"
        case "minus_fault":
            log = "\(Date().normalizeDate()): попытка уменьшить значение счётчика ниже 0\n"
        case "clear":
            log = "\(Date().normalizeDate()): значение сброшено\n"
        default:
            log = "Error with logging\n"
        }
        
        historyTextView.text.append(log)
        
        // Автоскролл historyTextView
        let lastLineRange = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(lastLineRange)
    }
    
    
    @IBAction func minusTapped() {
        if currentCounterValue > 0 {
            currentCounterValue -= 1
            createLog(situation: "minus_success")
        } else {
            createLog(situation: "minus_fault")
        }
    }
    
    
    @IBAction func plusTapped() {
        currentCounterValue += 1
        createLog(situation: "plus")
    }
    
    
    
    @IBAction func clearTapped() {
        currentCounterValue = 0
        createLog(situation: "clear")
    }
}

