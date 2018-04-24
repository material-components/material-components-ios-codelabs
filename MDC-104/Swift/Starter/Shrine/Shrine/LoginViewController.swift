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
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = .white
    scrollView.directionalLayoutMargins =
        NSDirectionalEdgeInsets(top: 0.0, leading:16.0, bottom: 0.0, trailing:16.0)
    return scrollView
  }()

  let contentView: UIView = {
    let contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.backgroundColor = .orange
    return contentView
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
    return passwordTextField
  }()

  let usernameTextFieldController: MDCTextInputControllerOutlined
  let passwordTextFieldController: MDCTextInputControllerOutlined

  // Buttons
  let cancelButton: MDCFlatButton = {
    let cancelButton = MDCFlatButton()
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("CANCEL", for: .normal)
    cancelButton.addTarget(self, action: #selector(didTapCancel(sender:)), for: .touchUpInside)
    return cancelButton
  }()
  let nextButton: MDCRaisedButton = {
    let nextButton = MDCRaisedButton()
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

    scrollView.backgroundColor = ApplicationScheme().surfaceColor

    view.addSubview(scrollView)

//    NSLayoutConstraint.activate(
//      NSLayoutConstraint.constraints(withVisualFormat: "V:|-0@751-[scrollView]-0@751-|",
//                                     options: [],
//                                     metrics: nil,
//                                     views: ["scrollView" : scrollView])
//    )
//    NSLayoutConstraint.activate(
//      NSLayoutConstraint.constraints(withVisualFormat: "H:|-0@751-[scrollView]-0@751-|",
//                                     options: [],
//                                     metrics: nil,
//                                     views: ["scrollView" : scrollView])
//    )

    scrollView.addSubview(contentView)

    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTouch))
    scrollView.addGestureRecognizer(tapGestureRecognizer)

    contentView.addSubview(titleLabel)
    contentView.addSubview(logoImageView)

    // TextFields
    contentView.addSubview(usernameTextField)
    contentView.addSubview(passwordTextField)

    // Buttons
    contentView.addSubview(nextButton)
    contentView.addSubview(cancelButton)


    // Constraints
    var constraints = [NSLayoutConstraint]()
    // self.scrollView to self.view
    constraints.append(NSLayoutConstraint(item: self.view,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .width,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: self.view,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .height,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: self.view,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: self.view,
                                          attribute: .centerY,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerY,
                                          multiplier: 1,
                                          constant: 0))

    // self.scrollView <> self.contentView
    constraints.append(NSLayoutConstraint(item: contentView,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .width,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: contentView,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: scrollView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: contentView,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: scrollView.contentLayoutGuide,
                                          attribute: .top,
                                          multiplier: 1,
                                          constant: 49))


    // self.contentView to its subviews
    constraints.append(NSLayoutConstraint(item: logoImageView,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: contentView,
                                          attribute: .top,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: logoImageView,
                                          attribute: .centerX,
                                          relatedBy: .equal,
                                          toItem: contentView,
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
                                          toItem: contentView,
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
                                          toItem: contentView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: usernameTextField,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: contentView,
                                          attribute: .width,
                                          multiplier: 1,
                                          constant: -16))
//    constraints.append(contentsOf:
//      NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-|",
//                                     options: [],
//                                     metrics: nil,
//                                     views: [ "username" : usernameTextField]))
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
                                          toItem: contentView,
                                          attribute: .centerX,
                                          multiplier: 1,
                                          constant: 0))
    constraints.append(NSLayoutConstraint(item: passwordTextField,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: contentView,
                                          attribute: .width,
                                          multiplier: 1,
                                          constant: -16))
//    constraints.append(contentsOf:
//      NSLayoutConstraint.constraints(withVisualFormat: "H:|-[password]-|",
//                                     options: [],
//                                     metrics: nil,
//                                     views: [ "password" : passwordTextField]))
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
                                          toItem: contentView,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: -20))

    NSLayoutConstraint.activate(constraints)

    self.view.backgroundColor = ApplicationScheme.scheme.surfaceColor
    self.logoImageView.tintColor = ApplicationScheme.scheme.onSurfaceColor
    self.titleLabel.textColor = ApplicationScheme.scheme.onSurfaceColor
    MDCTextFieldColorThemer.applySemanticColorScheme(ApplicationScheme.scheme,
                                                     to: self.usernameTextFieldController)
    MDCTextFieldColorThemer.applySemanticColorScheme(ApplicationScheme.scheme,
                                                     to: self.passwordTextFieldController)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme,
                                                  to: self.cancelButton)
    MDCButtonColorThemer.applySemanticColorScheme(ApplicationScheme.scheme,
                                                  to: self.nextButton)

    titleLabel.font = ApplicationScheme.scheme.headline5
    MDCTextFieldTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme,
                                                       to: usernameTextFieldController)
    MDCTextFieldTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme,
                                                       to: passwordTextFieldController)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme,
                                                    to: cancelButton)
    MDCButtonTypographyThemer.applyTypographyScheme(ApplicationScheme.scheme,
                                                    to: nextButton)
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
