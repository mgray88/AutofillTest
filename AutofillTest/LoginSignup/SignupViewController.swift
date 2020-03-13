//
//  SignupViewController.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/10/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import PanModal
import UIKit

final class SignupViewController: AccountViewController {

    private var signupView: SignupView!

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) disabled")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        signupView = SignupView()
        signupView.inputFields.layer.borderColor = UIColor.hex(0xB7B8B9).cgColor
        signupView.inputFields.layer.borderWidth = 1.0

        self.view.addSubview(signupView)
        self.signupView.edgesToSuperview()
        self.signupView.contentView.widthToSuperview()
        self.view.backgroundColor = .white
    }

    override var panScrollable: UIScrollView? {
        self.signupView
    }

    override var shortFormHeight: PanModalHeight {
        self.view.layoutIfNeeded()
        return .contentHeight(self.signupView.contentSize.height)
    }
}
