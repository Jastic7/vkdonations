//
//  InputFieldTableViewCell.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

class InputFieldTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .subheadRegular
        label.textColor = .subhead
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    private let textView: UITextView = {
        let textView = UITextView()
        textView.textContainerInset = .init(top: 12, left: 12, bottom: 12, right: 12)
        textView.font = .headlineRegular
        textView.textColor = .placeholder
        textView.layer.backgroundColor = UIColor.background.cgColor
        textView.layer.cornerRadius = 10
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.setContentCompressionResistancePriority(.required, for: .vertical)
        return textView
    }()

    private var item: InputFieldItem?

    private let placeholderColor: UIColor = .placeholder
    private let contentColor: UIColor = .text

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        setupSubviews()

        textView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])

        contentView.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with item: InputFieldItem) {
        titleLabel.text = item.title
        textView.text = item.text ?? item.placeholder
        textView.textColor = item.text == nil ? placeholderColor : contentColor

        self.item = item
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            textView.becomeFirstResponder()
        } else {
            textView.resignFirstResponder()
        }
    }

    static let reuseIdentifier = String(describing: InputFieldTableViewCell.self)
}

extension InputFieldTableViewCell: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if item?.text == nil || item?.text?.isEmpty == true {
            textView.text = nil
        }

        updateCellSize()
    }

    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = placeholderColor
        } else {
            textView.textColor = contentColor
        }

        updateCellSize()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        item?.text = textView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        textView.text = (item?.text == nil || item?.text?.isEmpty == true) ? item?.placeholder : item?.text
    }

    private func updateCellSize() {
        // Dirty and weird hack, but it is Hackaton <3
        let tableView = superview as? UITableView
        tableView?.beginUpdates()
        tableView?.endUpdates()
    }
}
