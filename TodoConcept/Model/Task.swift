//
//  Task.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class Task: NSObject {
  
  var title: String = ""
  var check: Bool = false
  
  init(title: String){
    
    super.init()
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    let dateString = dateFormatter.string(from: date)
    
    self.title = title
    
  }
}

