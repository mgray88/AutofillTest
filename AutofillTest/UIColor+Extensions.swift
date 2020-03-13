//
//  UIColor+Extensions.swift
//  AutofillTest
//
//  Created by Michael Gray on 3/13/20.
//  Copyright © 2020 Michael Gray. All rights reserved.
//

import UIKit

@objc
extension UIColor {
    static func hex(_ RGB: NSInteger) -> UIColor {
        return self.init(red: CGFloat((RGB >> 16) & 0xFF) / 255.0,
                         green: CGFloat((RGB >> 8) & 0xFF) / 255.0,
                         blue: CGFloat(RGB & 0xFF) / 255.0,
                         alpha: 1)
    }
}
