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

    init() {
        super.init(nibName: nil, bundle: nil)

        view = mainView
        mainView.backgroundColor = .white

        setupEvents()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func buttonTapped(_ sender: UIButton) {
        presentAlert(title: "Ouch", message: "You hit me!")
    }

    private func setupEvents() {
        mainView.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

