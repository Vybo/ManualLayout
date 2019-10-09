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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

