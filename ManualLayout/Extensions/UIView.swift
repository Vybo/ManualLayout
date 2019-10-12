//
//  UIView.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 12/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ subviewsToAdd: UIView...) {
        subviewsToAdd.forEach(addSubview)
    }

    func centerInSuperviewVertically() {
        guard let superview = superview else { return }
        frame.origin.y = superview.frame.size.height / 2 - frame.size.height / 2
    }

    func centerInSuperViewHorizontally() {
        guard let superview = superview else { return }
        frame.origin.x = superview.frame.size.width / 2 - frame.size.width / 2
    }
}
