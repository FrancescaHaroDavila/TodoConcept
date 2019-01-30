//
//  CustomCollectionViewCell.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 1/24/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

@IBDesignable
class CustomCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet weak var taskPercentage: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var cardTitle: UILabel!
  @IBOutlet weak var cardIcon: UIImageView!
  @IBOutlet weak var cardTaskCount: UILabel!

  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    self.layer.shadowPath =
      UIBezierPath(roundedRect: self.bounds,
                   cornerRadius: self.layer.cornerRadius).cgPath
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.1
    self.layer.shadowOffset = CGSize(width: 5, height: 5)
    self.layer.shadowRadius = 5
    self.layer.masksToBounds = false
  
  }
  
}
