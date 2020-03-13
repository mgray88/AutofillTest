//
//  PaddingLabel.swift
//  Takeout Central
//
//  Created by Michael Gray on 7/16/19.
//  Copyright © 2019 Takeout Central. All rights reserved.
//
//  Thanks to:
//  https://stackoverflow.com/questions/27459746/adding-space-padding-to-a-uilabel/39998301
//

import UIKit

@IBDesignable public class PaddingLabel: UILabel {

    @IBInspectable public var topInset: CGFloat = 5.0
    @IBInspectable public var bottomInset: CGFloat = 5.0
    @IBInspectable public var leftInset: CGFloat = 7.0
    @IBInspectable public var rightInset: CGFloat = 7.0

    var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset = newValue.top
            leftInset = newValue.left
            bottomInset = newValue.bottom
            rightInset = newValue.right
        }
    }

    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width += leftInset + rightInset
        adjSize.height += topInset + bottomInset
        return adjSize
    }

    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override public var intrinsicContentSize: CGSize {
        let systemContentSize = super.intrinsicContentSize
        let adjustSize = CGSize(
            width: systemContentSize.width + leftInset + rightInset,
            height: systemContentSize.height + topInset +  bottomInset)
        if adjustSize.width > preferredMaxLayoutWidth && preferredMaxLayoutWidth != 0 {
            let constraintSize = CGSize(
                width: bounds.width - (leftInset + rightInset),
                height: .greatestFiniteMagnitude)
            let newSize = super.sizeThatFits(constraintSize)
            return CGSize(width: systemContentSize.width, height: ceil(newSize.height) + topInset + bottomInset)
        } else {
            return adjustSize
        }
    }
}
