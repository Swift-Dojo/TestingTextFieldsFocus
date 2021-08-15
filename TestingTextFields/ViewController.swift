//
//  ViewController.swift
//  TestingTextFields
//
//  Created by Mario Alberto Barragán Espinosa on 15/08/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet private(set) var usernameField: UITextField!
  @IBOutlet private(set) var passwordField: UITextField!
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    if textField === usernameField {
      passwordField.becomeFirstResponder()
      return false
    }
    
    textField.resignFirstResponder()
    
    return false
  }
}

