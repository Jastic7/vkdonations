//
//  PrimaryButton.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

final class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .primaryBackground
        setTitleColor(.primaryForeground, for: .normal)
        titleLabel?.font = .textMedium
        contentEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16)
        layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
