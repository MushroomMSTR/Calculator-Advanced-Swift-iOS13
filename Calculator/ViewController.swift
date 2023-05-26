//
//  ViewController.swift
//  Calculator
//
//  Created by NazarStf on 26.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		guard let calcButtonTitle = sender.currentTitle else {
			return
		}
		
		switch calcButtonTitle {
		case "AC":
			displayLabel.text = "0"
		case "+/-":
			if let currentText = displayLabel.text {
				if currentText.hasPrefix("-") {
					displayLabel.text = String(currentText.dropFirst())
				} else {
					displayLabel.text = "-" + currentText
				}
			}
		case "%":
			if let currentText = displayLabel.text, let number = Double(currentText) {
				let result = number / 100.0
				displayLabel.text = String(result)
			}
		// Add cases for any new buttons here
		default:
			break
		}
	}
    
	@IBAction func numButtonPressed(_ sender: UIButton) {
		if let numValue = sender.currentTitle {
			if displayLabel.text == "0" {
				displayLabel.text = numValue
			} else if let currentText = displayLabel.text {
				displayLabel.text = currentText + numValue
			}
		}
	}

}
