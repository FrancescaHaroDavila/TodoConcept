//
//  CheckBox.swift
//  TodoConcept
//
//  Created by Francesca Valeria Haro Dávila on 2/1/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

  
  let checkedImage = UIImage(named: "checked")! as UIImage
  let uncheckedImage = UIImage(named: "unchecked")! as UIImage
  
  override func awakeFromNib() {
    self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
    self.setImage(checkedImage, for: .selected)
    self.setImage(uncheckedImage, for: .normal)
  }
  
  @objc func buttonClicked(sender: UIButton) {
      isSelected = !isSelected
  
  }

}
