//
//  EmptyViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .textRegular
        label.textColor = .text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Не успель 😴🤷🏼‍♂️🤝"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Конец"
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
