//
//  SwitchControlPresenter.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class SwitchControlPresenter: ControlPresenting {
  
  private var switchValue = false
  
  func controlName() -> String {
    return "UISwitch"
  }
  
  func controlValue() -> String {
    return "\(self.switchValue)"
  }
  
  func controlFactory() -> ControlFactory {
    return SwitchControlFactory(switchValue: self.switchValue, delegate: self)
  }
}

extension SwitchControlPresenter: SwitchControlFactoryDelegate {
  func switchFlipped(_ value: Bool) {
    self.switchValue = value
  }
}
