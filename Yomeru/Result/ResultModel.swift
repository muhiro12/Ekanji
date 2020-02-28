//
//  ResultModel.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Hydra

protocol ResultModelInput {
    var original: String { get }
    var converted: String { get }
    func update(original: String, completion: ((String) -> Void)?) throws
}

final class ResultModel: ResultModelInput {
    var original: String
    var converted: String

    init(original: String, converted: String) {
        self.original = original
        self.converted = converted
    }

    func update(original: String, completion: ((String) -> Void)?) throws {
        self.original = original

        do {
            try KanaConverter.hiragana.run(with: original).then { result in
                self.converted = result
                let database = Database()
                database.save(original: original, converted: result)
                completion?(result)
            }
        }
    }
}
