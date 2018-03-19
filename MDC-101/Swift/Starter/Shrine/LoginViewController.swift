/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit
import MaterialComponents

class LoginViewController: UIViewController {
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false;
    scrollView.backgroundColor = UIColor.white
    scrollView.layoutMargins = UIEdgeInsetsMake(0, 16, 0, 16)
    return scrollView
  }()

  let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "Shrine"
    titleLabel.sizeToFit()
    return titleLabel
  }()

  let logoImageView: UIImageView = {
    let logoImageView = UIImageView(image: UIImage.init(named: "ShrineLogo"))
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    return logoImageView
  }()

  // Text Fields

  // Buttons


  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    registerKeyboardNotifications()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
      super.viewDidLoad()

      view.addSubview(scrollView)

      NSLayoutConstraint.activate(
        NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|",
                                       options: [],
                                       metrics: nil,
                                       views: ["scrollView" : scrollView])
        )
      NSLayoutConstraint.activate(
        NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|",
                                       options: [],
                                       metrics: nil,
                                       views: ["scrollView" : scrollView])
      )
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTouch))
      scrollView.addGestureRecognizer(tapGestureRecognizer)

      scrollView.addSubview(titleLabel)
      scrollView.addSubview(logoImageView)

      // TextFields

      // Buttons


      // Constraints
      var constraints = [NSLayoutConstraint]()
      constraints.append(NSLayoutConstraint(item: titleLabel,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: scrollView.contentLayoutGuide,
                                            attribute: .topMargin,
                                            multiplier: 1,
                                            constant: 40))
      constraints.append(NSLayoutConstraint(item: titleLabel,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0))
      constraints.append(NSLayoutConstraint(item: logoImageView,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: titleLabel,
                                            attribute: .bottom,
                                            multiplier: 1,
                                            constant: 49))
      constraints.append(NSLayoutConstraint(item: logoImageView,
                                            attribute: .centerX,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .centerX,
                                            multiplier: 1,
                                            constant: 0))
      // Text Fields

      // Buttons


      NSLayoutConstraint.activate(constraints)
    }

  @objc func didTapTouch(sender: UIGestureRecognizer) {
    view.endEditing(true)
  }

  func registerKeyboardNotifications() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.keyboardWillShow),
      name: NSNotification.Name(rawValue: "UIKeyboardWillShowNotification"),
      object: nil)
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.keyboardWillShow),
      name: NSNotification.Name(rawValue: "UIKeyboardWillChangeFrameNotification"),
      object: nil)
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.keyboardWillHide),
      name: NSNotification.Name(rawValue: "UIKeyboardWillHideNotification"),
      object: nil)
  }

  @objc func keyboardWillShow(notification: NSNotification) {
    let keyboardFrame =
      (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.height, 0);
  }

  @objc func keyboardWillHide(notification: NSNotification) {
    self.scrollView.contentInset = UIEdgeInsets.zero;
  }
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder();

    return false
  }
}


