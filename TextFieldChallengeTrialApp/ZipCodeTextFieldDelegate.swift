//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldChallengeTrialApp
//
//  Created by Divya Kabra on 5/9/17.
//  Copyright © 2017 Divya Kabra. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: Properties
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length <= 5 // We do not want the entry to exceed the length of 5 since it is a zip code
        
    }
    
    // MARK: Dismissing the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true // Returning true means that the text field will implement its default behaviour
    }
}
