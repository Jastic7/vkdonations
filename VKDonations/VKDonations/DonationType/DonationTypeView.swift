//
//  DonationTypeView.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class DonationTypeView: UIControl {

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }

    var icon: UIImage? {
        didSet {
            imageView.image = icon
        }
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .headlineSemibold
        label.textColor = .text
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .caption1Regular
        label.textColor = .subhead
        return label
    }()

    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private let chevronImageView: UIImageView = {
        let image = UIImage(named: "chevron_right_24")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fadeLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(white: 0, alpha: 0.1).cgColor
        layer.opacity = 0
        layer.cornerRadius = 10
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .imageBorder
        layer.cornerRadius = 10

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {
        addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
        ])

        addSubview(chevronImageView)

        NSLayoutConstraint.activate([
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])

        addSubview(titlesStackView)

        NSLayoutConstraint.activate([
            titlesStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titlesStackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            titlesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titlesStackView.trailingAnchor.constraint(lessThanOrEqualTo: chevronImageView.leadingAnchor, constant: -12)
        ])

        layer.addSublayer(fadeLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        fadeLayer.frame = bounds
    }

    override var isHighlighted: Bool {
        didSet {
            fadeLayer.opacity = isHighlighted ? 1 : 0
        }
    }
}
