//
//  CountingCollectionDataSource.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 12/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

final class CountingCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let numberOfItems: Int

    init(numberOfItems: Int) {
        self.numberOfItems = numberOfItems
        super.init()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: TitleWithRoundedButtonCollectionCell.self),
            for: indexPath
        )
    }
}
