//
//  GoalDonationTableViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

class GoalDonationTableViewController: UITableViewController {

    let inputFieldItems: [InputFieldItem] = {
        let nameItem = InputFieldItem(title: "Название сбора", placeholder: "Название сбора")
        let amountItem = InputFieldItem(title: "Сумма, ₽", placeholder: "Сколько нужно собрать?")
        let goalItem = InputFieldItem(title: "Цель", placeholder: "Например, лечение человека")
        let descriptionItem = InputFieldItem(title: "Описание", placeholder: "На что пойдут деньги и как они кому-то помогут?")
        let destinationItem = InputFieldItem(title: "Куда получать деньги", placeholder: "", text: "Счёт VK Pay · 1234")

        return [nameItem, amountItem, goalItem, descriptionItem, destinationItem]
    }()

    private let nextButton: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle("Далее", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        tableView.register(InputFieldTableViewCell.self, forCellReuseIdentifier: InputFieldTableViewCell.reuseIdentifier)
        tableView.register(UploadImageTableViewCell.self, forCellReuseIdentifier: UploadImageTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0, left: 0, bottom: 102, right: 0)
        tableView.keyboardDismissMode = .onDrag

        setupSubviews()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inputFieldItems.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = indexPath.row == 0 ? UploadImageTableViewCell.reuseIdentifier : InputFieldTableViewCell.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)


        if let inputFieldCell = cell as? InputFieldTableViewCell {
            let item = inputFieldItems[indexPath.row - 1]
            inputFieldCell.configure(with: item)
        }

        return cell
    }

    private func setupSubviews() {
        view.addSubview(bottomBar)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),

            bottomBar.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -12),
            bottomBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
