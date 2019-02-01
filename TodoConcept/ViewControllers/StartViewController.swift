//
//  ViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.


import UIKit
import Firebase

class StartViewController: UIViewController {

  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBAction func btnLogin(_ sender: UIButton) {
  }
  
  @IBAction func btnSignUp(_ sender: UIButton) {
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidAppear(_ animated: Bool){
    super.viewDidAppear(animated)
    if Auth.auth().currentUser != nil {
      self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
    }
  }

}

