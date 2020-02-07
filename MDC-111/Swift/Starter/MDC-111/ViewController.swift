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

class ViewController: UIViewController, UITextFieldDelegate {
  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var address: UITextField!
  @IBOutlet weak var city: UITextField!
  @IBOutlet weak var state: UITextField!
  @IBOutlet weak var zip: UITextField!

  @IBOutlet weak var saveButton: UIButton!

  // MARK: Properties

  override func viewDidLoad() {
    super.viewDidLoad()

    // TODO: Instantiate controllers
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    // TODO: Update `hitAreaInsets`.
  }

  // MARK: UITextFieldDelegate methods

  // MARK: Target / Action

  @IBAction func saveDidTouch(_ sender: Any) {
    view.endEditing(true)

    let alert = UIAlertController(title: "Do you accept these terms?", message: kLorem, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
      self.name.text = nil
      self.address.text = nil
      self.city.text = nil
      self.state.text = nil
      self.zip.text = nil
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
