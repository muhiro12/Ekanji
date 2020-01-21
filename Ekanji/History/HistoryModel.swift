//
//  HistoryModel.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol HistoryModelInput {
    func fetchHistories() -> [History]
}

final class HistoryModel: HistoryModelInput {

    func fetchHistories() -> [History] {
        // TODO: DB取得処理 追加
        let histories = [
            History(original: "first", converted: "FIRST"),
            History(original: "second", converted: "SECOND"),
            History(original: "third", converted: "THIRD")
        ]
        return histories
    }

}

struct History {
    let original: String
    let converted: String
}
