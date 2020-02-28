//
//  HistoryModel.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/21.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol HistoryModelInput {
    func fetchHistories(completion: (() -> Void)?) -> [History]
}

final class HistoryModel: HistoryModelInput {

    func fetchHistories(completion: (() -> Void)?) -> [History] {
        let database = Database()
        let histories = database.fetch().map {
            History(original: $0.original, converted: $0.converted)
        }
        completion?()
        return histories
    }

}

struct History {
    let original: String
    let converted: String
}
