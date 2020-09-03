//
//  ControlPresenting.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//


protocol ControlPresenting {
  func controlName() -> String
  func controlValue() -> String
  func controlFactory() -> ControlFactory
}
