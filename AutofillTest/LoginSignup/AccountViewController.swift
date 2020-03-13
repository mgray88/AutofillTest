//
//  AccountViewController.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/10/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import PanModal
import UIKit

class AccountViewController: UIViewController, PanModalPresentable {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.observeKeyboard()
    }

    var panScrollable: UIScrollView? {
        nil
    }

    var panModalBackgroundColor: UIColor {
        UIColor.black.withAlphaComponent(0.35)
    }

    var shortFormHeight: PanModalHeight {
        .intrinsicHeight
    }

    var longFormHeight: PanModalHeight {
        .maxHeight
    }

    var anchorModalToLongForm: Bool { false }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    var showDragIndicator: Bool {
        false
    }

    var shouldRoundTopCorners: Bool {
        (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > 0
    }

    func willTransition(to state: PanModalPresentationController.PresentationState) {
        switch state {
        case .shortForm:
            self.panScrollable?.resignFirstResponder()
        case .longForm:
            (self.panScrollable as? LoginSignupBase)?
                .inputFields.subviews.first?.becomeFirstResponder()
        }
    }

    func panModalWillDismiss() {
        self.panScrollable?.resignFirstResponder()
    }
}
