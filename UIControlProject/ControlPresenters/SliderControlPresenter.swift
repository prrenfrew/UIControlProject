//
//  SliderControlPresenter.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class SliderControlPresenter: ControlPresenting {
  
  private var sliderValue = 0.5
  
  func controlName() -> String {
    return "UISlider"
  }
  
  func controlValue() -> String {
    return "\(self.sliderValue)"
  }
  
  func controlFactory() -> ControlFactory {
    return SliderControlFactory(sliderValue: self.sliderValue, delegate: self)
  }
}

extension SliderControlPresenter: SliderControlFactoryDelegate {
  func updateValue(with value: Double) {
    self.sliderValue = value
  }
}
