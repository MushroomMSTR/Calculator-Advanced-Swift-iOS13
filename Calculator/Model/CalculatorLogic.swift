//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by NazarStf on 27.05.2023.
//

import Foundation

class CalculatorLogic {
	private var displayText: String = "0"
	
	func handleButtonPress(_ buttonTitle: String) -> String {
		switch buttonTitle {
		case "AC":
			displayText = "0"
		case "+/-":
			toggleSign()
		case "%":
			calculatePercentage()
		case ".":
			addDecimalPoint()
		default:
			appendNumber(buttonTitle)
		}
		
		return displayText
	}
	
	private func toggleSign() {
		if displayText.hasPrefix("-") {
			displayText.removeFirst()
		} else {
			displayText = "-" + displayText
		}
	}
	
	private func calculatePercentage() {
		if let number = Double(displayText) {
			let result = number / 100.0
			displayText = formatResult(result)
		}
	}
	
	private func addDecimalPoint() {
		if !displayText.contains(".") {
			displayText += "."
		}
	}
	
	private func appendNumber(_ number: String) {
		if displayText == "0" {
			displayText = number
		} else {
			displayText += number
		}
	}
	
	private func formatResult(_ number: Double) -> String {
		return String(number)
	}
}

