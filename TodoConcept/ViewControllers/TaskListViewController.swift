//
//  TaskListViewController.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 2/1/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
  let TableViewCellIdentifier = "TableViewCel"

  override func viewDidLoad() {
    super.viewDidLoad()
//    tableView.allowsMultipleSelectionDuringEditing = true
//    tableView.isEditing = !isEditing
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TableViewCell else {
      return UITableViewCell()
    }
    
    cell.taskLabel.text = numbers[indexPath.row]
  
    return cell
  }
  
}
