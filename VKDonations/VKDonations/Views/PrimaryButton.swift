//
//  PrimaryButton.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class PrimaryButton: UIButton {

    private let fadeLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.init(white: 0, alpha: 0.1).cgColor
        layer.opacity = 0
        layer.cornerRadius = 10
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .primaryBackground
        setTitleColor(.primaryForeground, for: .normal)
        titleLabel?.font = .title3Medium
        contentEdgeInsets = .init(top: 11, left: 16, bottom: 11, right: 16)
        layer.cornerRadius = 10

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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
