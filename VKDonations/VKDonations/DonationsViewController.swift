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
        button.addTarget(self, action: #selector(createDonation(button:)), for: .touchUpInside)
        button.titleLabel?.font = .textMedium
        button.contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
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

        title = "Пожертвования"
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(placeholderStackView)
        NSLayoutConstraint.activate([
            placeholderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeholderStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc
    func createDonation(button: PrimaryButton) {
        let type1 = DonationType(title: "Целевой сбор", subtitle: "Когда есть определенная цель", iconName: "target_outline_28")
        let type2 = DonationType(title: "Регулярный сбор", subtitle: "Если помощь нужна ежемесячно", iconName: "calendar_outline_28")

        let viewController = DonationTypesViewController(donationTypes: [type1, type2])
        navigationController?.pushViewController(viewController, animated: true)
    }
}
