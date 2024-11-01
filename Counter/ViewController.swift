//
//  ViewController.swift
//  Counter
//
//  Created by Сомов Кирилл on 01.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var counter: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    let impactSoft = UIImpactFeedbackGenerator(style: .soft)
    
    private var currentCounterValue = 0 {
        didSet {
            counter.text = String(currentCounterValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        textViewSetup()
    }
    
    
    private func buttonSetup() {
        minusButton.tintColor = .systemBlue
        plusButton.tintColor = .systemRed
        clearButton.tintColor = .systemGray
    }
    
    
    private func textViewSetup() {
        historyTextView.text.append("История изменений\n")
    }
    
    
    private func createLog(situation: String) {
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
    
    
    @IBAction private func minusTapped() {
        if currentCounterValue > 0 {
            currentCounterValue -= 1
            createLog(situation: "minus_success")
            impactSoft.impactOccurred()
        } else {
            createLog(situation: "minus_fault")
            impactMedium.impactOccurred()
        }
    }
    
    
    @IBAction private func plusTapped() {
        impactSoft.impactOccurred()
        currentCounterValue += 1
        createLog(situation: "plus")
    }
    
    
    @IBAction private func clearTapped() {
        impactHeavy.impactOccurred()
        currentCounterValue = 0
        createLog(situation: "clear")
    }
}

