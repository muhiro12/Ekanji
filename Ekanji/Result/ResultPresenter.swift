//
//  ResultPresenter.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/20.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation

protocol ResultPresenterInput {
    var original: String { get }
    var converted: String { get }
}

protocol ResultPresenterOutput: AnyObject {}

final class ResultPresenter: ResultPresenterInput {

    private weak var view: ResultPresenterOutput!

    var original: String
    var converted: String

    init(view: ResultPresenterOutput, original: String, converted: String) {
        self.view = view
        self.original = original
        self.converted = converted
    }
}
