//
//  HomeViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/18/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
  
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var taskCount: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  var user = User()
  var card = Card()
  @IBAction func logOutAction(_ sender: UIBarButtonItem) {
    do {
      try Auth.auth().signOut()
    }
    catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let initial = storyboard.instantiateInitialViewController()
    UIApplication.shared.keyWindow?.rootViewController = initial
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func setData(){
    self.lblName.text = "Hello, " + user.name
    self.taskCount.text = "You have " + String(card.tasks.count) + " tasks to do today."
 
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    let dateString = dateFormatter.string(from: date)
    
    self.lblDate.text = "TODAY: " + dateString
  }
}

