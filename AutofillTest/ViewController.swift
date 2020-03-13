//
//  ViewController.swift
//  AutofillTest
//
//  Created by Michael Gray on 3/13/20.
//  Copyright © 2020 Michael Gray. All rights reserved.
//

import PanModal
import TinyConstraints
import UIKit

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.setTitle("Launch Modal", for: .normal)
        button.addTarget(self, action: #selector(launchModal), for: .primaryActionTriggered)

        self.view.addSubview(button)
        button.centerInSuperview()
    }

    @objc private func launchModal() {
        let view = self.view!
        let viewController = LoginViewController()
        self.presentPanModal(
            viewController,
            sourceView: view,
            sourceRect: CGRect(
                x: view.bounds.midX,
                y: view.bounds.midY,
                width: 0.0,
                height: 0.0))
    }

}
