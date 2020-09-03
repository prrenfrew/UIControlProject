//
//  SwitchControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol SwitchControlFactoryDelegate {
  func switchFlipped(_ value: Bool)
}

class SwitchControlFactory: ControlFactory {
  
  private let switchValue: Bool
  private var delegate: SwitchControlFactoryDelegate?
  
  init(switchValue: Bool, delegate: SwitchControlFactoryDelegate?) {
    self.switchValue = switchValue
    self.delegate = delegate
  }
  
  func needsWidth() -> Bool {
    return false
  }
  
  @objc func switchChanged(_ sender: UISwitch) {
    self.delegate?.switchFlipped(sender.isOn)
  }
  
  func build() -> UIView {
    let switchControl = UISwitch()
    switchControl.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
    switchControl.isOn = self.switchValue
    return switchControl
  }
}
