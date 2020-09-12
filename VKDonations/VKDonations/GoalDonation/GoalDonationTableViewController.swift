//
//  GoalDonationTableViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

class GoalDonationTableViewController: UITableViewController {

    let inputFieldItems: [InputFieldItem]
    let actionTitle: String
    let action: () -> Void

    init(inputFieldItems: [InputFieldItem], actionTitle: String, action: @escaping () -> Void) {
        self.inputFieldItems = inputFieldItems
        self.actionTitle = actionTitle
        self.action = action

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var nextButton: PrimaryButton = {
        let button = PrimaryButton()
        button.setTitle(actionTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
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
        tableView.keyboardDismissMode = .onDrag

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

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

    override func viewDidLayoutSubviews() {
        tableView.contentInset = .init(top: 0, left: 0, bottom: bottomBar.frame.height, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
    }

    @objc
    private func didTapActionButton() {
        action()
    }
}
