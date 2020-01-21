//
//  HomeModel.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol HomeModelInput {
    func convert(text: String, completion: ((String) -> Void)?)
}

final class HomeModel: HomeModelInput {

    func convert(text: String, completion: ((String) -> Void)?) {
        // TODO: API処理 追加
        let result = text.uppercased()
        completion?(result)

        // TODO: DB保存処理 追加
    }

}
