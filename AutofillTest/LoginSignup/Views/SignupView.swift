//
//  SignupView.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/4/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import Foundation
import TinyConstraints

final class SignupView: LoginSignupBase {

    let firstNameTextField = IconTextField(
        icon: UIImage(named: "icon_username")!, placeholder: "First Name").then {
            $0.textContentType = .givenName
            $0.autocapitalizationType = .words
        }
    let lastNameTextField = IconTextField(
        icon: UIImage(named: "icon_username")!, placeholder: "Last Name").then {
            $0.textContentType = .familyName
            $0.autocapitalizationType = .words
        }
    let emailTextField = IconTextField(
        icon: UIImage(named: "icon_email")!, placeholder: "Email").then {
            $0.textContentType = .username
            $0.autocapitalizationType = .none
            $0.keyboardType = .emailAddress
        }
    let passwordTextField = PasswordTextField(
        icon: UIImage(named: "icon_password")!, placeholder: "Password").then {
            if #available(iOS 12.0, *) {
                $0.textContentType = .newPassword
            } else {
                $0.textContentType = .password
            }
            $0.autocapitalizationType = .none
        }
    let confirmPassTextField = PasswordTextField(
        icon: UIImage(named: "icon_password")!, placeholder: "Confirm Password").then {
            if #available(iOS 12.0, *) {
                $0.textContentType = .newPassword
            } else {
                $0.textContentType = .password
            }
            $0.autocapitalizationType = .none
        }

    let loginLabel = PaddingLabel().then {
        $0.text = "Already have an account? Login"
        $0.insets = .uniform(12.0)
    }

    override init() {
        super.init()

        loadView()
        installConstraints()
    }

    private func loadView() {
        submitButton.setTitle("Sign Up", for: .normal)

        inputFields.do {
            $0.addSubview(firstNameTextField)
            $0.addSubview(lastNameTextField)
            $0.addSubview(emailTextField)
            $0.addSubview(passwordTextField)
            $0.addSubview(confirmPassTextField)
        }
        supplemental.addSubview(loginLabel)

        firstNameTextField.setNext(textField: lastNameTextField)
        lastNameTextField.setNext(textField: emailTextField)
        emailTextField.setNext(textField: passwordTextField)
        passwordTextField.setNext(textField: confirmPassTextField)
        confirmPassTextField.returnKeyType = .done
    }

    private func installConstraints() {

        inputFields.stack(inputFields.subviews, height: 44.0, spacing: 1.0)

        loginLabel.topToBottom(of: rememberMeView)
        loginLabel.centerXToSuperview()
        loginLabel.bottomToSuperview()
    }
}
