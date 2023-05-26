//
//  ViewController.swift
//  Calculator
//
//  Created by NazarStf on 26.05.2023.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var displayLabel: UILabel!
	
	private var calculatorLogic = CalculatorLogic()
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		guard let calcButtonTitle = sender.currentTitle else {
			return
		}
		
		let result = calculatorLogic.handleButtonPress(calcButtonTitle)
		displayLabel.text = result
	}
	
	@IBAction func numButtonPressed(_ sender: UIButton) {
		if let numValue = sender.currentTitle {
			let result = calculatorLogic.handleButtonPress(numValue)
			displayLabel.text = result
		}
	}
}
