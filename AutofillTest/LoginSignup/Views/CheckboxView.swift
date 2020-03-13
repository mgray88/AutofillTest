//
//  CheckboxView.swift
//  Takeout Central
//
//  Created by Michael Gray on 8/15/19.
//  Copyright © 2019 Takeout Central. All rights reserved.
//

import Foundation
import TinyConstraints
import UIKit

@IBDesignable
final class CheckboxView: UIControl {

    private let checkbox = UIView().then {
        $0.layer.cornerRadius = 2
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.backgroundColor = .white
    }

    private let checkmark = UIImageView(image: UIImage(named: "icon_checkmark")!)

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        loadView()
        installConstraints()
    }

    private func loadView() {
        isSelected = true

        addSubview(checkbox)
        addSubview(checkmark)

        clipsToBounds = false

        isAccessibilityElement = true
    }

    private func installConstraints() {
        checkbox.size(CGSize(width: 16.0, height: 16.0))
        checkbox.edgesToSuperview()

        checkmark.size(CGSize(width: 25.0, height: 25.0))
        checkmark.leftToSuperview()
        checkmark.bottomToSuperview()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 16.0, height: 16.0)
    }

    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            super.sendActions(for: .primaryActionTriggered)

            checkmark.isHidden = !newValue
            if newValue {
                accessibilityTraits.insert(.selected)
            } else {
                accessibilityTraits.remove(.selected)
            }
        }
    }
}
