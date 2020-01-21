//
//  ResultModel.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol ResultModelInput {
    var original: String { get }
    var converted: String { get }
    func update(original: String, completion: (() -> Void)?)
}

final class ResultModel: ResultModelInput {
    var original: String
    var converted: String

    init(original: String, converted: String) {
        self.original = original
        self.converted = converted
    }

    func update(original: String, completion: (() -> Void)? = nil) {
        self.original = original
        // TODO: API処理 追加
        self.converted = original.uppercased()
        completion?()
    }
}
