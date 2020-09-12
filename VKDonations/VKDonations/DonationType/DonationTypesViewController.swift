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
        let viewController: UIViewController?

        if donationTypeView.title == donationTypes.first?.title {
            viewController = GoalDonationTableViewController(inputFieldItems: makeGoalDonatesItems())
            viewController?.title = "Целевой сбор"
        } else if donationTypeView.title == donationTypes.last?.title {
            viewController = GoalDonationTableViewController(inputFieldItems: makeRegularDonatesItems())
            viewController?.title = "Регулярный сбор"
        } else {
            viewController = nil
        }

        viewController.map { navigationController?.pushViewController($0, animated: true) }
    }

    private func makeGoalDonatesItems() -> [InputFieldItem] {
        let nameItem = InputFieldItem(title: "Название сбора", placeholder: "Название сбора")
        let amountItem = InputFieldItem(title: "Сумма, ₽", placeholder: "Сколько нужно собрать?")
        let goalItem = InputFieldItem(title: "Цель", placeholder: "Например, лечение человека")
        let descriptionItem = InputFieldItem(title: "Описание", placeholder: "На что пойдут деньги и как они кому-то помогут?")
        let destinationItem = InputFieldItem(title: "Куда получать деньги", placeholder: "Счет зачисления", text: "Счёт VK Pay · 1234")

        return [nameItem, amountItem, goalItem, descriptionItem, destinationItem]
    }

    private func makeRegularDonatesItems() -> [InputFieldItem] {
           let authorItem = InputFieldItem(title: "Автор", placeholder: "Автор", text: "Морозов Андрей")

           return makeGoalDonatesItems() + [authorItem]
       }
}
