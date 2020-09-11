//
//  DonationsViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class DonationsViewController: UIViewController {

    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "У Вас пока нет сборов.\nНачните доброе дело."
        label.font = .textRegular
        label.textColor = .secondary
        label.numberOfLines = 2
        return label
    }()

    lazy var donationCreateButton: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle("Создать сбор", for: .normal)
        return button
    }()

    lazy var placeholderStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [placeholderLabel, donationCreateButton])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(placeholderStackView)
        NSLayoutConstraint.activate([
            placeholderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
