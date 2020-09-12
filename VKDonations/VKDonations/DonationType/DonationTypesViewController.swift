//
//  DonationTypesViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class DonationTypesViewController: UIViewController {

    let donationTypes: [DonationType]

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init(donationTypes: [DonationType]) {
        self.donationTypes = donationTypes

        super.init(nibName: nil, bundle: nil)

        title = "Тип сбора"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        setupSubviews()
    }

    private func setupSubviews() {
        let donationTypeViews: [DonationTypeView] = donationTypes.map {
            let view = DonationTypeView()
            view.title = $0.title
            view.subtitle = $0.subtitle
            view.icon = UIImage(named: $0.iconName)
            view.addTarget(self, action: #selector(didSelect(donationTypeView:)), for: .touchUpInside)
            return view
        }

        donationTypeViews.forEach { stackView.addArrangedSubview($0) }

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }

    @objc
    private func didSelect(donationTypeView: DonationTypeView) {
        if donationTypeView.title == donationTypes.first?.title {
            let goalDonationViewController = GoalDonationTableViewController()
            goalDonationViewController.title = "Целевой сбор"
            navigationController?.pushViewController(goalDonationViewController, animated: true)
        } else if donationTypeView.title == donationTypes.last?.title {

        }
    }
}
