//
//  HomePresenter.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol HomePresenterInput {
    func tappedConvert(text: String)
}

protocol HomePresenterOutput: AnyObject {
    func transitionToResult(original: String, converted: String)
    func showAlert(title: String?, message: String?)
}

final class HomePresenter: HomePresenterInput {

    private weak var view: HomePresenterOutput!
    private var model: HomeModelInput

    init(view: HomePresenterOutput, model: HomeModelInput) {
        self.view = view
        self.model = model
    }

    func tappedConvert(text: String) {
        model.convert(text: text) { result in
            if true {
                self.view.transitionToResult(original: text, converted: result)
            } else {
                self.view.showAlert(title: "title", message: "message")
            }
        }
    }

}
