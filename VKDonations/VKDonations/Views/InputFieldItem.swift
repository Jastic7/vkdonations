//
//  InputFieldModel.swift
//  VKDonations
//
//  Created by Andrey Morozov on 12.09.2020.
//  Copyright © 2020 PreviousStation. All rights reserved.
//

import Foundation

struct InputFieldItem {
    let title: String
    let placeholder: String
    var text: String?
}

extension InputFieldItem {
    init(title: String, placeholder: String) {
        self.init(title: title, placeholder: placeholder, text: nil)
    }
}
