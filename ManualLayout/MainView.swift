//
//  MainView.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 09/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

final class MainView: UIView {

    let button = RoundedButton()

    init() {
        super.init(frame: .zero)

        addSubview(button)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let buttonWidth: CGFloat = bounds.width / 3 * 2
        let buttonHeight: CGFloat = 36

        button.frame = CGRect(
            x: bounds.width / 2 - buttonWidth / 2,
            y: bounds.height / 2 - buttonHeight / 2,
            width: buttonWidth,
            height: buttonHeight
        )
    }

    private func setupButton() {
        button.borderColor = .blue
        button.borderWidth = 1
        button.borderCornerRadius = 6

        button.setTitle("Hit me!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
    }
}
