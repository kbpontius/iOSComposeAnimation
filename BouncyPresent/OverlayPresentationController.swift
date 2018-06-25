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

class OverlayPresentationController: UIPresentationController {
  let dimmingView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    return view
  }()
  
  override func presentationTransitionWillBegin() {
    dimmingView.frame = containerView!.bounds
    dimmingView.alpha = 0.0
    containerView!.insertSubview(dimmingView, at: 0)
    
    presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 1.0
    })
  }
  
  override func dismissalTransitionWillBegin() {
    presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0.0
    }) { _ in
      self.dimmingView.removeFromSuperview()
    }
  }
  
  override var frameOfPresentedViewInContainerView: CGRect {
    var size = containerView!.bounds.size
    size.height = size.height - 40
    return CGRect(origin: CGPoint(x: 0, y: 40), size: size)
  }
  
  override func containerViewWillLayoutSubviews() {
    dimmingView.frame = containerView!.bounds
    presentedView?.frame = frameOfPresentedViewInContainerView
  }
}
