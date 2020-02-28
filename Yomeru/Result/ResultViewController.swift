//
//  ResultViewController.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var originalTextView: UITextView!
    @IBOutlet weak var convertedTextView: UITextView!
    @IBOutlet weak var updateButton: UIButton!

    private var presenter: ResultPresenterInput!
    func inject(presenter: ResultPresenterInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        originalTextView.text = presenter.original
        convertedTextView.text = presenter.converted

        hero.isEnabled = true
        originalTextView.hero.id = Identifier.Hero.originalTextView.rawValue
        convertedTextView.hero.modifiers = [.translate(CGPoint(x: 0, y: 800))]
        updateButton.hero.modifiers = [.fade, .scale(), .translate(CGPoint(x: 0, y: 200))]

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.systemTeal.cgColor,
            UIColor.white.cgColor
        ]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func tapUpdate(_ sender: Any) {
        presenter.tappedUpdate(text: originalTextView.text)
    }

    @IBAction func tabClose(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func recognizeSwipe(_ sender: Any) {
        dismiss(animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension ResultViewController: ResultPresenterOutput {

    func updateTextView(original: String, converted: String) {
        originalTextView.text = original
        convertedTextView.text = converted
    }

}
