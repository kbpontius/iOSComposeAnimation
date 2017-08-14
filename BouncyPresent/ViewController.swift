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
            let overlayVC = segue.destination
            prepareOverlayVC(overlayVC)
        }
    }
    
    @IBAction func handleBouncyPresentPressed(_ sender: AnyObject) {
        if let overlayVC = storyboard?.instantiateViewController(withIdentifier: "overlayViewController") {
            prepareOverlayVC(overlayVC)
            present(overlayVC, animated: true, completion: nil)
        }
    }
    
    fileprivate func prepareOverlayVC(_ overlayVC: UIViewController) {
        overlayVC.transitioningDelegate = overlayTransitioningDelegate
        overlayVC.modalPresentationStyle = .custom
    }
    
}

