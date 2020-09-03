//
//  UpdateControlViewController.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

protocol UpdateControlViewControllerDelegate {
  func saveValue()
}

class UpdateControlViewController: UIViewController {
  @IBOutlet weak var controlContainerView: UIView!
  var controlFactory: ControlFactory!
  var delegate: UpdateControlViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let control = self.controlFactory.build()
    control.translatesAutoresizingMaskIntoConstraints = false
    self.controlContainerView.addSubview(control)
    control.centerYAnchor.constraint(equalTo: self.controlContainerView.centerYAnchor).isActive = true
    control.centerXAnchor.constraint(equalTo: self.controlContainerView.centerXAnchor).isActive = true
    guard self.controlFactory.needsWidth() else { return }
    control.widthAnchor.constraint(equalTo: self.controlContainerView.widthAnchor).isActive = true
  }
  
  @IBAction func saveControlValue(_ sender: Any) {
    self.delegate?.saveValue()
    self.navigationController?.popViewController(animated: true)
  }
}
