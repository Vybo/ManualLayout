//
//  ViewController.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 09/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let mainView = MainView()

    private let dataSource = CountingCollectionDataSource(numberOfItems: 20)

    init() {
        super.init(nibName: nil, bundle: nil)

        view = mainView
        mainView.backgroundColor = .white

        mainView.collectionView.dataSource = dataSource
        mainView.collectionView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Nothing here for now, because we only want to react to button taps.
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let width = collectionView.bounds.width
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {

        if let cell = cell as? TitleWithRoundedButtonCollectionCell {
            cell.configure(title: "I'm a cell number \(indexPath.item)", buttonTitle: "Hit me!")
            
            cell.buttonTappedHandler = { [weak self] in
                self?.presentAlert(title: "You hit me!", message: "You hit a button of cell no. \(indexPath.item).")
            }
        }
    }
}
