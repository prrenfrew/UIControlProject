//
//  ControlFactory.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol ControlFactory {
  func needsWidth() -> Bool
  func build() -> UIView
}
