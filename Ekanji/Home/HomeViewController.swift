//
//  HomeViewController.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!

    private lazy var presenter = HomePresenter(view: self)

    @IBAction func tapConvert(_ sender: Any) {
        presenter.tappedConvert(text: textView.text)
    }

}

extension HomeViewController: HomePresenterOutput {

    func transitionToResult(original: String, converted: String) {
        let view = ResultViewController()
        let presenter = ResultPresenter(view: view, original: original, converted: converted)
        view.inject(presenter: presenter)
        present(view, animated: true)
    }

    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default, handler: nil))
        present(alert, animated: true)
    }

}
