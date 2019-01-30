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
  var pictureName: String = ""
  var picture: UIImage? {
    return UIImage(named: self.pictureName)
  }
  
 
}
