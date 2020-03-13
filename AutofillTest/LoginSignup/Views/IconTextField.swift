//
//  IconTextField.swift
//  Takeout Central
//
//  Created by Michael Gray on 3/3/20.
//  Copyright © 2020 Takeout Central. All rights reserved.
//

import Then
import UIKit

class IconTextField: ChainedTextField {

    private let icon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }

    init(icon: UIImage, placeholder: String) {
        self.icon.image = icon

        super.init()
        self.placeholder = placeholder

        loadView()
    }

    private func loadView() {
        backgroundColor = .white
        leftView = icon
        leftViewMode = .always
        leftView?.width(44.0)
    }
}
