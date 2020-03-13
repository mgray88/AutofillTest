//
//  PasswordTextField.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/4/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import UIKit

final class PasswordTextField: IconTextField {

    private let showPasswordButton = UIButton(type: .custom).then {
        $0.imageEdgeInsets = .init(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
    }

    override init(icon: UIImage, placeholder: String) {
        super.init(icon: icon, placeholder: placeholder)

        loadView()
        setupBindings()
    }

    private func loadView() {
        self.textContentType = .password
        self.isSecureTextEntry = true

        rightView = showPasswordButton
        rightViewMode = .always
        rightView?.width(44.0)

        showPasswordButton.setImage(UIImage(named: "icon_eye_slash")!, for: .normal)
    }

    private func setupBindings() {
        self.showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
    }

    @objc
    private func showPassword() {
        self.isSecureTextEntry = !(self.isSecureTextEntry)

        if self.isSecureTextEntry {
            self.showPasswordButton.setImage(UIImage(named: "icon_eye_slash")!, for: .normal)
        } else {
            self.showPasswordButton.setImage(UIImage(named: "icon_eye")!, for: .normal)
        }

        if let textRange = self.textRange(from: self.beginningOfDocument, to: self.endOfDocument) {
            self.replace(textRange, withText: self.text!)
        }
    }
}
