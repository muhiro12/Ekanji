//
//  HomeViewController.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var textView: CustomTextView!
    @IBOutlet weak var convertButton: UIButton!

    private lazy var presenter = HomePresenter(view: self, model: HomeModel())

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = ""
        convertButton.layer.cornerRadius = 8

        convertButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        convertButton.layer.shadowColor = UIColor.systemGray.cgColor
        convertButton.layer.shadowRadius = 2
        convertButton.layer.shadowOpacity = 0.8
        convertButton.clipsToBounds = false
    }

    @IBAction func tapConvert(_ sender: Any) {
        presenter.tappedConvert(text: textView.text)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension HomeViewController: HomePresenterOutput {

    func transitionToResult(original: String, converted: String) {
        textView.text = ""

        let view = ResultViewController()
        let model = ResultModel(original: original, converted: converted)
        let presenter = ResultPresenter(view: view, model: model)
        view.inject(presenter: presenter)

        view.modalPresentationStyle = .fullScreen
        textView.hero.id = "temp"

        present(view, animated: true)
    }

    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default, handler: nil))
        present(alert, animated: true)
    }

}
