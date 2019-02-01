//
//  Card.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/30/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class Card: NSObject {
  
  var title: String = ""
  var tasks: [Task] = []
  var imageName: String = ""
  var image: UIImage? {
    return UIImage(named: self.imageName)
  }
  
  init(title: String, imageName: String) {
    super.init()
    self.title = title
    self.imageName = imageName
  }
  
}
