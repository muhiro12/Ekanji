//
//  ResultPresenter.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/20.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol ResultPresenterInput {
    var original: String { get }
    var converted: String { get }
    func tappedUpdate(text: String)
}

protocol ResultPresenterOutput: AnyObject {
    func updateTextView(original: String, converted: String)
    func startLoading()
    func stopLoading()
}

final class ResultPresenter: ResultPresenterInput {

    private weak var view: ResultPresenterOutput!
    private var model: ResultModelInput

    var original: String {
        return model.original
    }
    var converted: String {
        return model.converted
    }

    init(view: ResultPresenterOutput, model: ResultModelInput) {
        self.view = view
        self.model = model
    }

    func tappedUpdate(text: String) {
        view.startLoading()
        do {
            try model.update(original: text) { result in
                DispatchQueue.main.async {
                    self.view.stopLoading()
                    self.view.updateTextView(original: text, converted: result)
                }
            }
        } catch {
            view.stopLoading()
            print(error)
        }
    }
}
