//
//  LoginView.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/3/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import Foundation
import TinyConstraints

final class LoginView: LoginSignupBase {

    let emailTextField = IconTextField(
        icon: UIImage(named: "icon_email")!, placeholder: "Email").then {
            $0.textContentType = .username
            $0.autocapitalizationType = .none
            $0.keyboardType = .emailAddress
    }
    let passwordTextField = PasswordTextField(
        icon: UIImage(named: "icon_password")!, placeholder: "Password").then {
            $0.textContentType = .password
            $0.autocapitalizationType = .none
    }

    let signupLabel = PaddingLabel().then {
        $0.text = "Don't have an account? Sign up"
        $0.insets = .uniform(12.0)
    }

    let forgotPasswordLabel = PaddingLabel().then {
        $0.text = "Forgot Password"
        $0.textColor = .hex(0x0083C6)
        $0.insets = .uniform(12.0)
    }

    override init() {
        super.init()

        loadView()
        installConstraints()
    }

    private func loadView() {
        submitButton.backgroundColor = .hex(0x0083C6)
        submitButton.setTitle("Login", for: .normal)

        inputFields.do {
            $0.addSubview(emailTextField)
            $0.addSubview(passwordTextField)
        }
        supplemental.do {
            $0.addSubview(signupLabel)
            $0.addSubview(forgotPasswordLabel)
        }

        emailTextField.setNext(textField: passwordTextField)
        passwordTextField.returnKeyType = .done
    }

    private func installConstraints() {

        inputFields.stack(inputFields.subviews, height: 44.0, spacing: 1.0)

        signupLabel.topToBottom(of: rememberMeView)
        signupLabel.centerXToSuperview()

        forgotPasswordLabel.topToBottom(of: signupLabel)
        forgotPasswordLabel.centerXToSuperview()
        forgotPasswordLabel.bottomToSuperview()
    }
}
