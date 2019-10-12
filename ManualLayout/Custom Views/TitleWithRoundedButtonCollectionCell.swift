//
//  TitleWithRoundedButtonCollectionCell.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 12/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

final class TitleWithRoundedButtonCollectionCell: UICollectionViewCell {

    private let titleLabel = UILabel()
    private let button = RoundedButton()

    var buttonTappedHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews(titleLabel, button)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        // This should be in some configuration structure sent to the configure function
        button.borderColor = .blue
        button.borderCornerRadius = 6
        button.borderWidth = 1
        button.setTitleColor(.blue, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, buttonTitle: String) {
        titleLabel.text = title
        button.setTitle(buttonTitle, for: .normal)
        setNeedsLayout() // This makes sure that everything will resize properly when new data is set after de-queueing
    }

    @objc func buttonTapped(_ sender: UIButton) {
        buttonTappedHandler?()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let minimumButtonWidth: CGFloat = 56
        let horizontalSpacing: CGFloat = 8

        // TitleLabel should be only as wide as needed, but there should always be some space left for the button,
        // if the containing collection cell is too small to fit both completely.
        let titleLabelSize = titleLabel.sizeThatFits(
            CGSize(width: bounds.width - minimumButtonWidth - horizontalSpacing * 2, height: bounds.height)
        )
        titleLabel.frame.size = titleLabelSize // Sets computed size
        titleLabel.centerInSuperviewVertically() // Centers the label on Y Axis -- Extensions/UIView.swift
        titleLabel.frame.origin.x = horizontalSpacing // Moves the label 8 points to the right


        // TitleLabel has priority on sizing when the cell is too small to fit both well, so button will concat.
        let buttonFittingSize = button.sizeThatFits(
            CGSize(width: bounds.width - titleLabelSize.width, height: bounds.height)
        )
        button.frame.size = buttonFittingSize
        button.centerInSuperviewVertically()
        // Positions the button with spacing from the trailing side of the cell
        button.frame.origin.x = bounds.width - buttonFittingSize.width - horizontalSpacing
    }
}
