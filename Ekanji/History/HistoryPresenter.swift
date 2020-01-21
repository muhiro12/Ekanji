//
//  HistoryPresenter.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/19.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol HistoryPresenterInput {
    var numberOfHistories: Int { get }
    func history(forRow row: Int) -> String?
    func selectedRow(at indexPath: IndexPath)
}

protocol HistoryPresenterOutput: AnyObject {
    func transitionToResult(original: String, converted: String)
}

final class HistoryPresenter: HistoryPresenterInput {

    private let histories = ["abc", "def", "ghi"]
    private weak var view: HistoryPresenterOutput!

    var numberOfHistories: Int {
        return histories.count
    }

    init(view: HistoryPresenterOutput) {
        self.view = view
    }

    func history(forRow row: Int) -> String? {
        guard row < histories.count else {
            return nil
        }
        return histories[row]
    }

    func selectedRow(at indexPath: IndexPath) {
        guard let history = history(forRow: indexPath.row) else {
            return
        }
        view.transitionToResult(original: history, converted: "History converted")
    }

}
