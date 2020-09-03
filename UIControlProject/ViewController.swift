//
//  ViewController.swift
//  UIControlProject
//
//  Created by MAC on 9/3/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//
/*
 2 controls
 1st screen: Tableview with each row saying the control name as well as the current value
 Tapping on a row should navigate to second screen
 
 2nd screen: Should display the control that was described in the row that was tapped. The control should be changeable by the user.
 
 There should also be a button to save the changes. This button should navigate back to the first screen, and the first screen should have the updated value
 */

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var controlsTableView: UITableView!
  
  var controlPresenters: [ControlPresenting] = [SwitchControlPresenter(), SliderControlPresenter()]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.controlsTableView.dataSource = self
    self.controlsTableView.delegate = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.controlPresenters.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle,
                               reuseIdentifier: "cell")
    let controlPresenter = self.controlPresenters[indexPath.row]
    cell.textLabel?.text = controlPresenter.controlName()
    cell.detailTextLabel?.text = controlPresenter.controlValue()
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let updateViewController = storyboard.instantiateViewController(identifier: "UpdateControlViewController") as! UpdateControlViewController
    updateViewController.controlFactory = self.controlPresenters[indexPath.row].controlFactory()
    updateViewController.delegate = self
    self.navigationController?.pushViewController(updateViewController, animated: true)
  }
}

extension ViewController: UpdateControlViewControllerDelegate {
  func saveValue() {
    self.controlsTableView.reloadData()
  }
}
