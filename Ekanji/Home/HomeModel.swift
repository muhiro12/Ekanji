//
//  HomeModel.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Hydra

protocol HomeModelInput {
    func convert(text: String, completion: ((String) -> Void)?) throws
}

final class HomeModel: HomeModelInput {

    func convert(text: String, completion: ((String) -> Void)?) throws {
        do {
            try KanaConverter.hiragana.run(with: text).then { result in
                completion?(result)
            }
        }

        // TODO: DB保存処理 追加
    }

}
