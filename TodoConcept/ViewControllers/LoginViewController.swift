//
//  LoginViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

//import UIKit
//import Firebase
//
//class LoginViewController: UIViewController {
//  
//  
//  @IBOutlet weak var imageView: UIImageView!
//  
//  @IBOutlet weak var txtEmail: UITextField!
//  
//  @IBOutlet weak var txtPassword: UITextField!
//  
//  
//  @IBAction func btnLogin(_ sender: UIButton) {
//    
//    Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
//      if error == nil{
//        self.performSegue(withIdentifier: "loginToHome", sender: self)
//      }
//      else{
//        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        
//        alertController.addAction(defaultAction)
//        self.present(alertController, animated: true, completion: nil)
//      }
//    }
//    
//    
//  }
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    // Do any additional setup after loading the view.
//  }
//  
//  
//}
