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
  
  override init(){
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let someDateTime = formatter.date(from: "2016/10/08 22:31")
  }
}
