//
//  RoundedButton.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 09/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    var borderColor: UIColor?
    var borderWidth: CGFloat?
    var borderCornerRadius: CGFloat?

    private func drawBorder() {

        guard let borderColor = borderColor, let borderWidth = borderWidth else { return }

        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor

        if let cornerRadius = borderCornerRadius {
            layer.cornerRadius = cornerRadius
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawBorder()
    }
}
