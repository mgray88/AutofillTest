//
//  LoginSignupBase.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/4/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import Foundation
import TinyConstraints

class LoginSignupBase: UIScrollView {

    let contentView = UIView()

    let inputFields = UIView().then {
        $0.backgroundColor = .hex(0xB7B8B9)
        $0.layer.cornerRadius = 2.0
        $0.layer.masksToBounds = true
    }

    let submitButton = UIButton().then {
        $0.isEnabled = false
        $0.layer.cornerRadius = 2.0
        $0.layer.masksToBounds = true
    }

    let supplemental = UIView()

    private let checkbox = CheckboxView()

    lazy var rememberMeView = UIView().then {
        let label = UILabel().then {
            $0.text = "Keep me logged in"
        }

        $0.addSubview(checkbox)
        $0.addSubview(label)

        $0.height(44.0)
        checkbox.leadingToSuperview(offset: 12.0)
        checkbox.centerYToSuperview()
        label.trailingToSuperview(offset: 12.0)
        label.leadingToTrailing(of: checkbox, offset: 12.0)
        checkbox.bottom(to: label)
    }

    init() {
        super.init(frame: .zero)

        loadView()
        installConstraints()
    }

    @available(*, unavailable)
    required public init?(coder _: NSCoder) {
        fatalError("init(coder:) disabled")
    }

    private func loadView() {
        self.isOpaque = false
        self.backgroundColor = .clear

        self.addSubview(contentView)
        contentView.addSubview(inputFields)
        contentView.addSubview(submitButton)
        contentView.addSubview(supplemental)
        supplemental.do {
            $0.addSubview(rememberMeView)
        }

        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(
            target: self, action: #selector(resignFirstResponder)))
        submitButton.addTarget(self, action: #selector(resignFirstResponder), for: .touchUpInside)
    }

    override func resignFirstResponder() -> Bool {
        inputFields.subviews.forEach {
            $0.resignFirstResponder()
        }
        return super.resignFirstResponder()
    }

    private func installConstraints() {
        contentView.edgesToSuperview()

        inputFields.edgesToSuperview(
            excluding: .bottom,
            insets: .horizontal(20.0) + .vertical(20.0))

        submitButton.horizontalToSuperview(insets: .horizontal(20.0))
        submitButton.topToBottom(of: inputFields, offset: 16.0)
        submitButton.height(44.0)

        supplemental.topToBottom(of: submitButton, offset: 16.0)
        supplemental.edgesToSuperview(
            excluding: .top,
            insets: .horizontal(20.0) + .vertical(20.0)
        )
//        supplemental.bottomToSuperview(offset: -20.0, relation: .equalOrLess)

        rememberMeView.topToSuperview()
        rememberMeView.centerXToSuperview()
    }
}
