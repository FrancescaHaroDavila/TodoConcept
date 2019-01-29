//
//  SignUpViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//
//import UIKit
//import Firebase
//
//class SignUpViewController: UIViewController {
//
//
//  @IBOutlet weak var imageView: UIImageView!
//
//  @IBOutlet weak var txtEmail: UITextField!
//
//  @IBOutlet weak var txtPassword: UITextField!
//
//  @IBOutlet weak var txtRetypePassword: UITextField!
//
//
//  @IBAction func btnSignUp(_ sender: UIButton) {
//
//    if txtPassword.text != txtRetypePassword.text {
//      let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
//      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//      alertController.addAction(defaultAction)
//      self.present(alertController, animated: true, completion: nil)
//    }
//    else{
//  
//      Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!){ (user, error) in
//        if error == nil {
//          self.performSegue(withIdentifier: "signupToHome", sender: self)
//        }
//        else{
//          let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//          let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//          alertController.addAction(defaultAction)
//          self.present(alertController, animated: true, completion: nil)
//        }
//      }
//    }
//
//  }
//  override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//
//}
