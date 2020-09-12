//
//  PostDonationViewController.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class PostDonationViewController: UIViewController {

    private let inputField: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .textRegular
        textView.textColor = .text
        return textView
    }()

    private let snippetImageView: UIImageView = {
        let image = UIImage(named: "snippet")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        title = "Андрей"
        setupSubviews()
        setupNavigationItem()
    }

    private func setupSubviews() {
        view.addSubview(inputField)

        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            inputField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            inputField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
        ])

        view.addSubview(snippetImageView)

        NSLayoutConstraint.activate([
            snippetImageView.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 12),
            snippetImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            snippetImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            snippetImageView.heightAnchor.constraint(equalToConstant: 246),
        ])
    }

    private func setupNavigationItem() {
        let backImage = UIImage(named: "dismiss_24")
        let backButton = UIButton()
        backButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        backButton.setImage(backImage, for: .normal)
        let buttonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = buttonItem

        let rightImage = UIImage(named: "send_sign_28")
        let rightButton = UIButton()
        rightButton.addTarget(self, action: #selector(sendPost), for: .touchUpInside)
        rightButton.setImage(rightImage, for: .normal)
        let rightItem = UIBarButtonItem(customView: rightButton)
        navigationItem.rightBarButtonItem = rightItem

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        inputField.becomeFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputField.resignFirstResponder()
    }

    @objc func closeScreen() {
        dismiss(animated: true, completion: nil)
    }

    @objc func sendPost() {
        let empty = EmptyViewController()
        navigationController?.pushViewController(empty, animated: true)
    }
}
