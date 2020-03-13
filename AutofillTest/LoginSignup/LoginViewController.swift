//
//  LoginViewController.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/9/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import PanModal
import UIKit

final class LoginViewController: AccountViewController {

    private var loginView: LoginView!

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) disabled")
    }

    override var disablesAutomaticKeyboardDismissal: Bool { false }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginView = LoginView()
        loginView.inputFields.layer.borderColor = UIColor.hex(0xB7B8B9).cgColor
        loginView.inputFields.layer.borderWidth = 1.0

        self.view.addSubview(loginView)
        self.loginView.edgesToSuperview()
        self.loginView.contentView.widthToSuperview()
        self.view.backgroundColor = .white
    }

    override var panScrollable: UIScrollView? {
        self.loginView
    }

    override var shortFormHeight: PanModalHeight {
        self.view.layoutIfNeeded()
        return .contentHeight(self.loginView.contentSize.height)
    }

    override var canBecomeFirstResponder: Bool {
        let ret = super.canBecomeFirstResponder
        print("***** UIViewController canBecomeFirstResponder -> \(ret) *****")
        return ret
    }

    override func becomeFirstResponder() -> Bool {
        let ret = super.becomeFirstResponder()
        print("***** UIViewController becomeFirstResponder -> \(ret) *****")
        return ret
    }

    override var canResignFirstResponder: Bool {
        let ret = super.canResignFirstResponder
        print("***** UIViewController canResignFirstResponder -> \(ret) *****")
        return ret
    }
}
