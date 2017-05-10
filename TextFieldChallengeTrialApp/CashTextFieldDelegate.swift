//
//  CashTextFieldDelegate.swift
//  TextFieldChallengeTrialApp
//
//  Created by Divya Kabra on 5/10/17.
//  Copyright © 2017 Divya Kabra. All rights reserved.
//

import Foundation
import UIKit
class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    // MARK: Properties
    let digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        
        // Initializing empty string to build the required newText
        var digitText = ""
        
        // checking if the characters entered are there in digits
        for c in newText.characters {
            if digits.contains(String(c)) {
                digitText.append("\(c)")
            }
        }
        
        // MARK: Formatting the new string
        // The unwrapping of the optional which is Int(digitText)
        
        if let numOfPennies = Int(digitText) {
            newText = "$"+String(numOfPennies/100)+"."+self.cents(numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        return false // Returning false keeps the old text
        
    }
    
    // To avoid the formatting error where the string becomes 0.4 instead of 0.04
    
    func cents(_ value: Int) -> String {
        var centString = String(value%100)
        if Int(centString)! < 10 {      // Gave an error so inserted "!"; Note optional behaviour here
            centString = "0" + centString
        }
        return centString
    }
    
    // Mark: Dismissing Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Mark: Placing "$0.00" in the text field initially
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
}
