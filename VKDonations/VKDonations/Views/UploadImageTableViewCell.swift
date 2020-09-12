//
//  UploadImageTableViewCell.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class UploadImageTableViewCell: UITableViewCell {

    private let borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.accent.cgColor
        layer.lineWidth = 1
        layer.lineDashPattern = [4, 4]
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()

    private let uploadedImageView: UIImageView = {
        let image = UIImage(named: "Cat")
        let imageView = UIImageView(image: image)
        imageView.isHidden = true
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Загрузить обложку"
        label.font = .headlineMedium
        label.textColor = .accent
        return label
    }()

    private let iconView: UIImageView = {
        let image = UIImage(named: "picture_outline_28")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(uploadImage))
        return recognizer
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        setupSubviews()

        contentView.addGestureRecognizer(tapRecognizer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -68),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])


        contentView.addSubview(uploadedImageView)

        layer.addSublayer(borderLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        borderLayer.frame = bounds

        let rect = bounds.inset(by: .init(top: 2, left: 12, bottom: 12, right: 12))
        borderLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 10).cgPath

        uploadedImageView.frame = rect
    }

    @objc private func uploadImage() {
        uploadedImageView.isHidden = false
        borderLayer.isHidden = true
    }
}
