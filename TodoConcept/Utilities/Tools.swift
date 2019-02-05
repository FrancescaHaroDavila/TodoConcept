//
//  Tools.swift
//  POCTodoList
//
//  Created by Carlo Aguilar on 2/1/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import UIKit

class Tools {
  
  func setTasksProgress(tasks: [Task], progressView: UIProgressView, progressLabel: UILabel){
    progressView.progress = getTasksProgress(tasks: tasks)
    progressLabel.text = String(progressView.progress * 100) + "%"
  }
  
  func getTasksProgress(tasks: [Task]) -> Float{
    if tasks.count == 0 {
      return 0
    }
    var completedTasksCounter: Float = 0.0
    for task in tasks {
      if task.check == true{
        completedTasksCounter += 1.0
      }
    }
    return Float(completedTasksCounter/Float(tasks.count))
  }
  
  func setTaskCountLabel(tasks: [Task], label: UILabel){
    
    var taskUnchecked = 0
    for task in tasks {
      if task.check == false {
        taskUnchecked += 1
        if taskUnchecked == 1 {
          label.text = "1 Task"
        }else {
          label.text = String(taskUnchecked) + " Tasks"
        }
      }
    }
  }
  
}
