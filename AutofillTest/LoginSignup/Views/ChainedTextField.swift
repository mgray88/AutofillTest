//
//  ChainedTextField.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/10/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import UIKit

class ChainedTextField: UITextField {
    private weak var nextField: UITextField?

    init() {
        super.init(frame: .zero)

        super.delegate = delegateProxy
    }

    @available(*, unavailable)
    required public init?(coder _: NSCoder) {
        fatalError("init(coder:) disabled")
    }

    private let delegateProxy = DelegateProxy()
    override var delegate: UITextFieldDelegate? {
        get {
            delegateProxy.userDelegate
        }
        set {
            delegateProxy.userDelegate = newValue
        }
    }

    /// Sets this field's `returnKeyType` to `.next` and adds a weak
    /// reference to `textField` that will `becomeFirstResponder` when
    /// this `textFieldShouldReturn`
    ///
    /// If `textField` is not set, this field calls `endEditing(true)`
    /// on `textFieldShouldReturn`
    func setNext(textField: UITextField) {
        self.returnKeyType = .next
        self.nextField = textField
    }

    fileprivate func textFieldShouldReturn() {
        if let next = nextField {
            next.becomeFirstResponder()
        } else {
            endEditing(true)
        }
    }

    override var canBecomeFirstResponder: Bool {
        let ret = super.canBecomeFirstResponder
        print("***** UITextField canBecomeFirstResponder -> \(ret) *****")
        return ret
    }

    override func becomeFirstResponder() -> Bool {
        let ret = super.becomeFirstResponder()
        print("***** UITextField becomeFirstResponder -> \(ret) *****")
        return ret
    }

    override var canResignFirstResponder: Bool {
        let ret = super.canResignFirstResponder
        print("***** UITextField canResignFirstResponder -> \(ret) *****")
        return ret
    }
}

private final class DelegateProxy: NSObject, UITextFieldDelegate {
    fileprivate weak var userDelegate: UITextFieldDelegate?

    override func responds(to aSelector: Selector!) -> Bool {
        return super.responds(to: aSelector) || userDelegate?.responds(to: aSelector) == true
    }

    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if userDelegate?.responds(to: aSelector) == true {
            return userDelegate
        }

        return super.forwardingTarget(for: aSelector)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("***** UITextField textFieldShouldReturn *****")
        (textField as? ChainedTextField)?.textFieldShouldReturn()
        return userDelegate?.textFieldShouldReturn?(textField) ?? false
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("***** UITextField textFieldShouldEndEditing *****")
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("***** UITextField textFieldShouldBeginEditing *****")
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("***** UITextField shouldChangeCharactersIn \(string) *****")
        return true
    }
}
