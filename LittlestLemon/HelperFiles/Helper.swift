//
//  Helper.swift
//  LittlestLemon
//
//  Created by ilaxoM1 on 11/08/24.
//

import Foundation

/// Validates email
func isValidEmail(_ email: String) -> Bool {
	// Simple regex pattern for validating an email address
	let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$"
	let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
	return emailPred.evaluate(with: email)
}
