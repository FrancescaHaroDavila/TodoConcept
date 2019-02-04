//
//  TaskListViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 2/1/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  
  
  
  let taskCellIdentifier = "TaskCell"
  let segueIdentifier = "HomeToCard"
  let homeViewControllerIdentifier = "HomeViewController"
  var card = Card(title: "", imageName: "")
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func toggleCellCheckbox(_ cell: TableViewCell, isCompleted: Bool) {
    if isCompleted {
      cell.taskLabel?.textColor = .black
    } else {
      cell.taskLabel?.textColor = .gray
    }
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return card.tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: self.taskCellIdentifier, for: indexPath) as? TableViewCell else {
      return UITableViewCell()
    }
    
    let task = self.card.tasks[indexPath.row]
    cell.taskLabel.text = task.title
    return cell
  }
 
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //esta linea "deselecciona" la celda, para que no se quede "seleccionada" para siempre
    tableView.deselectRow(at: indexPath, animated: true)
    
    
    if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
      
      
      let task = card.tasks[indexPath.row]
      
      if(task.check == false) {
        toggleCellCheckbox(cell, isCompleted: false)
        self.card.tasks[indexPath.row].check = true
      }else{
        toggleCellCheckbox(cell, isCompleted: true)
        self.card.tasks[indexPath.row].check = false
      }

    }
  }
}
