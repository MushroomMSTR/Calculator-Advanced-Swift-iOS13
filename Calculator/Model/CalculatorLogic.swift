//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by NazarStf on 27.05.2023.
//

import Foundation

struct CalculatorLogic {
	private var displayText: String = "0"
	private var firstOperand: Double?
	private var secondOperand: Double?
	private var currentOperator: String?
	
	mutating func handleButtonPress(_ buttonTitle: String) -> String {
		switch buttonTitle {
		case "AC":
			clear()
		case "+/-":
			toggleSign()
		case "%":
			calculatePercentage()
		case ".":
			addDecimalPoint()
		case "÷", "×", "-", "+":
			handleOperator(buttonTitle)
		case "=":
			calculateResult()
		default:
			appendNumber(buttonTitle)
		}
		
		return displayText
	}
	
	private mutating func clear() {
		displayText = "0"
		firstOperand = nil
		secondOperand = nil
		currentOperator = nil
	}
	
	private mutating func toggleSign() {
		if displayText.hasPrefix("-") {
			displayText.removeFirst()
		} else {
			displayText = "-" + displayText
		}
	}
	
	private mutating func calculatePercentage() {
		if let number = Double(displayText) {
			let result = number / 100.0
			displayText = formatResult(result)
		}
	}
	
	private mutating func addDecimalPoint() {
		if !displayText.contains(".") {
			displayText += "."
		}
	}
	
	private mutating func appendNumber(_ number: String) {
		if displayText == "0" {
			displayText = number
		} else {
			displayText += number
		}
	}
	
	private mutating func handleOperator(_ operatorSymbol: String) {
		if let number = Double(displayText) {
			firstOperand = number
			currentOperator = operatorSymbol
			displayText = "0"
		}
	}
	
	private mutating func calculateResult() {
		if let firstNumber = firstOperand, let secondNumber = Double(displayText), let operation = currentOperator {
			var result: Double
			
			switch operation {
			case "÷":
				result = firstNumber / secondNumber
			case "×":
				result = firstNumber * secondNumber
			case "-":
				result = firstNumber - secondNumber
			case "+":
				result = firstNumber + secondNumber
			default:
				return
			}
			
			displayText = formatResult(result)
			firstOperand = nil
			secondOperand = nil
			currentOperator = nil
		}
	}
	
	private func formatResult(_ number: Double) -> String {
		return String(number)
	}
}
