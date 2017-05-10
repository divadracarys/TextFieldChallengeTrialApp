//
//  ViewController.swift
//  TextFieldChallengeTrialApp
//
//  Created by Divya Kabra on 5/9/17.
//  Copyright © 2017 Divya Kabra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // How come there is no use for NSObject here??
    
    // MARK: Outlets
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var onSwitch: UISwitch!
    
    // MARK: Properties
    let zipCode = ZipCodeTextFieldDelegate()
    let cashText = CashTextFieldDelegate()
    

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Food for thought: Why are we setting the delegates in viewDidLoad?
        
        self.textField1.delegate = zipCode
        self.textField2.delegate = cashText
        self.textField3.delegate = self
        self.onSwitch.setOn(false, animated: false)
        
    }
    
    // MARK: Text Field Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self.onSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions

    @IBAction func startWriting(_ sender: Any) {
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }

}

