//
// Copyright 2014 Scott Logic
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit

class ViewController: UIViewController {
  let overlayTransitioningDelegate = OverlayTransitioningDelegate()
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    if segue.identifier == "bouncySegue" {
      prepareOverlay(viewController: segue.destination)
    }
  }
    
  @IBAction func handleBouncyPresentPressed(sender: AnyObject) {
    guard let overlayViewController = storyboard?.instantiateViewController(withIdentifier: "overlayViewController") else {
        fatalError("Unable to instantiate ViewController with identifier 'overlayViewController'")
    }
    prepareOverlay(viewController: overlayViewController)
    present(overlayViewController, animated: true)
  }
    
  private func prepareOverlay(viewController: UIViewController) {
    viewController.transitioningDelegate = overlayTransitioningDelegate
    viewController.modalPresentationStyle = .custom
  }
}



