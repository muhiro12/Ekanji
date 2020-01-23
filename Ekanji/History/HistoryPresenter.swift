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
    func changedSearchBarText(to text: String)
    func willAppear()
    func history(forRow row: Int) -> History?
    func selectedRow(at indexPath: IndexPath)
}

protocol HistoryPresenterOutput: AnyObject {
    func clearSearchBar()
    func reloadTableView()
    func transitionToResult(original: String, converted: String)
}

final class HistoryPresenter: HistoryPresenterInput {

    private weak var view: HistoryPresenterOutput!
    private var model: HistoryModelInput

    private lazy var histories = model.fetchHistories(completion: nil)
    private lazy var historiesForDisplay = histories

    var numberOfHistories: Int {
        return historiesForDisplay.count
    }

    init(view: HistoryPresenterOutput, model: HistoryModelInput) {
        self.view = view
        self.model = model
    }

    func changedSearchBarText(to text: String) {
        if text.isEmpty {
            historiesForDisplay = histories
        } else {
            historiesForDisplay = histories.filter {
                $0.original.contains(text) || $0.converted.contains(text)
            }
        }
        view.reloadTableView()
    }

    func willAppear() {
        histories = model.fetchHistories {
            DispatchQueue.main.async {
                self.historiesForDisplay = self.histories
                self.view.clearSearchBar()
                self.view.reloadTableView()
            }
        }
    }

    func history(forRow row: Int) -> History? {
        guard row < historiesForDisplay.count else {
            return nil
        }
        return historiesForDisplay[row]
    }

    func selectedRow(at indexPath: IndexPath) {
        guard let history = history(forRow: indexPath.row) else {
            return
        }
        view.transitionToResult(original: history.original,
                                converted: history.converted)
    }

}
