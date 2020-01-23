//
//  CustomTextView.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/24.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

    override func draw(_ rect: CGRect) {
        layer.borderColor = UIColor.systemTeal.cgColor
        layer.borderWidth = 4
        layer.cornerRadius = 4
    }

}
