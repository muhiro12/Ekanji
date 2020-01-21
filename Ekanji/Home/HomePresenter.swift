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

    init(view: HomePresenterOutput) {
        self.view = view
    }

    func tappedConvert(text: String) {
        // TODO: API 呼び出し
        if true {
            view.transitionToResult(original: text, converted: text.uppercased())
        } else {
            view.showAlert(title: "title", message: "message")
        }
    }

}
