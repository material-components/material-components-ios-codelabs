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
    scrollView.backgroundColor = .white
    scrollView.layoutMargins = UIEdgeInsetsMake(0, 16, 0, 16)
    return scrollView
  }()

  let logoImageView: UIImageView = {
    let baseImage = UIImage.init(named: "ShrineLogo")
    let templatedImage = baseImage?.withRenderingMode(.alwaysTemplate)
    let logoImageView = UIImageView(image: templatedImage)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    return logoImageView
  }()

  let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "SHRINE"
    titleLabel.sizeToFit()
    return titleLabel
  }()

  // Text Fields
  let usernameTextField: MDCTextField = {
    let usernameTextField = MDCTextField()
    usernameTextField.translatesAutoresizingMaskIntoConstraints = false
    usernameTextField.clearButtonMode = .unlessEditing;
    return usernameTextField
  }()
  let passwordTextField: MDCTextField = {
    let passwordTextField = MDCTextField()
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.isSecureTextEntry = true
    return passwordTextField
  }()

  let usernameTextFieldController: MDCTextInputControllerOutlined
  let passwordTextFieldController: MDCTextInputControllerOutlined

  // Buttons
  let cancelButton: MDCButton = {
    let cancelButton = MDCButton()
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("CANCEL", for: .normal)
    cancelButton.addTarget(self, action: #selector(didTapCancel(sender:)), for: .touchUpInside)
    return cancelButton
  }()
  let nextButton: MDCButton = {
    let nextButton = MDCButton()
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.setTitle("NEXT", for: .normal)
    nextButton.addTarget(self, action: #selector(didTapNext(sender:)), for: .touchUpInside)
    return nextButton
  }()

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    usernameTextFieldController = MDCTextInputControllerOutlined(textInput: usernameTextField)
    passwordTextFieldController = MDCTextInputControllerOutlined(textInput: passwordTextField)
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    usernameTextFieldController.placeholderText = "Username"
    usernameTextField.delegate = self
    passwordTextFieldController.placeholderText = "Password"
    passwordTextField.delegate = self
    registerKeyboardNotifications()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.tintColor = .black
    scrollView.backgroundColor = .white

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
    usernameTextField.backgroundColor = scrollView.backgroundColor
    passwordTextField.backgroundColor = scrollView.backgroundColor
    scrollView.addSubview(usernameTextField)
    scrollView.addSubview(passwordTextField)

    // Buttons
    scrollView.addSubview(nextButton)
    scrollView.addSubview(cancelButton)


    // Constraints
    var constraints = [NSLayoutConstraint]()
    constraints.append(NSLayoutConstraint(item: logoImageView,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: scrollView.contentLayoutGuide,
                                          attribute: .top,
                                          multiplier: 1,
                                          constant: 49))
    constraints.append(NSLayoutConstraint(item: logoImageView,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: titleLabel,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: logoImageView,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 22))
    constraints.append(NSLayoutConstraint(item: titleLabel,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    // Text Fields
    constraints.append(NSLayoutConstraint(item: usernameTextField,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: titleLabel,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 22))
    constraints.append(NSLayoutConstraint(item: usernameTextField,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(contentsOf:
      NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-|",
                                     options: [],
                                     metrics: nil,
                                     views: [ "username" : usernameTextField]))
    constraints.append(NSLayoutConstraint(item: passwordTextField,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: usernameTextField,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 8))
    constraints.append(NSLayoutConstraint(item: passwordTextField,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(contentsOf:
      NSLayoutConstraint.constraints(withVisualFormat: "H:|-[password]-|",
                                     options: [],
                                     metrics: nil,
                                     views: [ "password" : passwordTextField]))
    // Buttons
    constraints.append(NSLayoutConstraint(item: cancelButton,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: passwordTextField,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 8))
    constraints.append(NSLayoutConstraint(item: cancelButton,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: nextButton,
                                          attribute: .centerY,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(contentsOf:
      NSLayoutConstraint.constraints(withVisualFormat: "H:[cancel]-[next]-|",
                                     options: NSLayoutFormatOptions(rawValue: 0),
                                     metrics: nil,
                                     views: [ "cancel" : cancelButton, "next" : nextButton]))
    constraints.append(NSLayoutConstraint(item: nextButton,
                                          attribute: .bottom,
                                          relatedBy: .equal,
                                          toItem: scrollView.contentLayoutGuide,
                                          attribute: .bottomMargin,
                                          multiplier: 1,
                                          constant: -20))

    NSLayoutConstraint.activate(constraints)

    // TODO: Theme the interface with our colors

    // TODO: Theme the interface with our typography
  }

  // MARK: - Gesture Handling

  @objc func didTapTouch(sender: UIGestureRecognizer) {
    view.endEditing(true)
  }

  // MARK: - Action Handling

  @objc func didTapNext(sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  @objc func didTapCancel(sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }

  // MARK: - Keyboard Handling

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

  // MARK: - UITextFieldDelegate

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder();

    // TextField
    if (textField == passwordTextField &&
      passwordTextField.text != nil &&
      passwordTextField.text!.count < 8) {
      passwordTextFieldController.setErrorText("Password is too short",
                                               errorAccessibilityValue: nil)
    }

    return false
  }
}
