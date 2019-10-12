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

        guard let borderColor = borderColor, let borderWidth = borderWidth else {
            layer.borderWidth = 0
            layer.borderColor = nil
            return
        }

        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor

        if let cornerRadius = borderCornerRadius {
            layer.cornerRadius = cornerRadius
        } else {
            layer.cornerRadius = 0
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawBorder()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let fittingSize = super.sizeThatFits(size)
        // This will make sure that the button has some spacing between the title and the border.
        return CGSize(width: fittingSize.width + 12, height: fittingSize.height + 12)
    }
}
