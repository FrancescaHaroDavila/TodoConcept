//
//  CustomVie.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/24/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.frame.size.height / 2
    self.clipsToBounds = true
    self.layer.shadowPath =
      UIBezierPath(roundedRect: self.bounds,
                   cornerRadius: self.layer.cornerRadius).cgPath
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.1
    self.layer.shadowOffset = CGSize(width: 8, height: 8)
    self.layer.shadowRadius = 5
    self.layer.masksToBounds = false
  }
}

