//
//  UITableViewCell+ReuseIdentifier.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
