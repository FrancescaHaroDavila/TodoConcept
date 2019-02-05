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
  @IBOutlet weak var imgCard: UIImageView!
  @IBOutlet weak var lblTaskCount: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var taskProgressView: UIProgressView!
  @IBOutlet weak var taskProgressPercentage: UILabel!
  @IBOutlet weak var btnBack: UIButton!
  @IBOutlet weak var btnMore: UIImageView!
  @IBOutlet weak var barStackView: UIStackView!
  @IBOutlet weak var infoStackView: UIStackView!
  @IBOutlet weak var progressStackView: UIStackView!
  @IBOutlet weak var lblToday: UILabel!
  @IBOutlet weak var carView: UIView!
  
  let taskCellIdentifier = "TaskCell"
  let functions = Tools()
  var card = Card(title: "", imageName: "")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.imgCard.image = UIImage(named: card.imageName)
    functions.setTaskCountLabel(tasks: card.tasks, label: self.lblTaskCount)
    functions.setTasksProgress(tasks: card.tasks, progressView: self.taskProgressView, progressLabel: self.taskProgressPercentage)
    self.lblTitle.text = card.title
    
  }
  
  func toggleCellCheckbox(_ cell: TableViewCell, isCompleted: Bool) {
    if isCompleted {
      cell.accessoryType = .none
      cell.taskLabel?.textColor = .black
    } else {
      cell.accessoryType = .checkmark
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
    if (task.check == false) {
      toggleCellCheckbox(cell, isCompleted: true)
    } else {
      toggleCellCheckbox(cell, isCompleted: false)
    }

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
    functions.setTaskCountLabel(tasks: card.tasks, label: self.lblTaskCount)
    functions.setTasksProgress(tasks: card.tasks, progressView: self.taskProgressView, progressLabel: self.taskProgressPercentage)
    
  }
}
