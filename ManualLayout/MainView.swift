//
//  MainView.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 09/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

final class MainView: UIView {

    let collectionView: UICollectionView

    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        return layout
    }()

    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

        super.init(frame: .zero)

        collectionView.backgroundColor = .clear
        addSubview(collectionView)

        collectionView.register(
            TitleWithRoundedButtonCollectionCell.self,
            forCellWithReuseIdentifier: String(describing: TitleWithRoundedButtonCollectionCell.self)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}
