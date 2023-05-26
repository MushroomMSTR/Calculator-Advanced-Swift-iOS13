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
		if let calcButtonTitle = sender.currentTitle {
			if calcButtonTitle == "AC" {
				displayLabel.text = "0"
			}
			// Handle other non-number button actions here
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
