//
//  LoginViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var txtEmail: UITextField!
  
  @IBOutlet weak var txtPassword: UITextField!
  
  
  @IBAction func btnLogin(_ sender: UIButton) {
    
    Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
      if error == nil{
        self.performSegue(withIdentifier: "loginToHome", sender: self)
      }
      else{
        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    txtEmail.delegate = self
    txtEmail.tag = 0
    txtPassword.delegate = self
    txtPassword.tag = 1
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y -= keyboardSize.height
      }
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    if self.view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
      nextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    return false
  }
  
}
