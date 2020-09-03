//
//  SliderControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol SliderControlFactoryDelegate {
  func updateValue(with value: Double)
}

class SliderControlFactory: ControlFactory {
  
  private let sliderValue: Double
  private var delegate: SliderControlFactoryDelegate?
  
  init(sliderValue: Double, delegate: SliderControlFactoryDelegate?) {
    self.sliderValue = sliderValue
    self.delegate = delegate
  }
  
  func needsWidth() -> Bool {
    return true
  }
  
  @objc func sliderValueChanged(_ sender: UISlider) {
    self.delegate?.updateValue(with: Double(sender.value))
  }
  
  func build() -> UIView {
    let sliderControl = UISlider()
    sliderControl.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged)
    sliderControl.value = Float(self.sliderValue)
    return sliderControl
  }
}
