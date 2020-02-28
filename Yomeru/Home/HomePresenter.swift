//
//  HomePresenter.swift
//  Yomeru
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
        do {
            try model.convert(text: text) { result in
                DispatchQueue.main.async {
                    self.view.transitionToResult(original: text, converted: result)
                }
            }
        } catch {
            self.view.showAlert(title: "Sorry", message: error.localizedDescription)
        }
    }

}
