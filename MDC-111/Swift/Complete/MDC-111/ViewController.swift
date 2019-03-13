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

class ViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var name: MDCTextField!
  @IBOutlet weak var address: MDCTextField!
  @IBOutlet weak var city: MDCTextField!
  @IBOutlet weak var state: MDCTextField!
  @IBOutlet weak var zip: MDCTextField!

  @IBOutlet weak var saveButton: MDCButton!
  let buttonScheme = MDCButtonScheme()

  // MARK: Properties

  var nameController: MDCTextInputControllerOutlined?
  var addressController: MDCTextInputControllerOutlined?
  var cityController: MDCTextInputControllerOutlined?
  var stateController: MDCTextInputControllerOutlined?
  var zipController: MDCTextInputControllerOutlined?

  override func viewDidLoad() {
    super.viewDidLoad()

    nameController = MDCTextInputControllerOutlined(textInput: name)
    addressController = MDCTextInputControllerOutlined(textInput: address)
    cityController = MDCTextInputControllerOutlined(textInput: city)
    stateController = MDCTextInputControllerOutlined(textInput: state)
    zipController = MDCTextInputControllerOutlined(textInput: zip)
    MDCContainedButtonThemer.applyScheme(buttonScheme, to: saveButton)

    zip.delegate = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    let verticalInset = min(0, (self.saveButton.bounds.height - 48) / 2)
    saveButton.hitAreaInsets = UIEdgeInsets(top: verticalInset,
                                            left: 0,
                                            bottom: verticalInset,
                                            right: 0)
  }

  // MARK: UITextFieldDelegate methods

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let text = textField.text,
    let range = Range(range, in: text),
    textField == zip else {
      return true
    }

    let finishedString = text.replacingCharacters(in: range, with: string)
    if finishedString.rangeOfCharacter(from: CharacterSet.letters) != nil {
      zipController?.setErrorText("Error: Zip can only contain numbers", errorAccessibilityValue: nil)
    } else {
      zipController?.setErrorText(nil, errorAccessibilityValue: nil)
    }

    return true
  }

  // MARK: Target / Action

  @IBAction func saveDidTouch(_ sender: Any) {
    view.endEditing(true)

    let alert = MDCAlertController(title: "Do you accept these terms?", message: kLorem)
    alert.addAction(MDCAlertAction(title: "Yes", handler: { (_) in
      self.name.text = nil
      self.address.text = nil
      self.city.text = nil
      self.state.text = nil
      self.zip.text = nil
    }))
    alert.addAction(MDCAlertAction(title: "Cancel", handler: nil))
    MDCAlertColorThemer.applySemanticColorScheme(self.buttonScheme.colorScheme, to: alert)
    MDCAlertTypographyThemer.applyTypographyScheme(self.buttonScheme.typographyScheme, to: alert)
    present(alert, animated: true, completion: nil)
  }
}
