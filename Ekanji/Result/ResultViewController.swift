//
//  ResultViewController.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var originalTextView: UITextView!
    @IBOutlet weak var convertedTextView: UITextView!

    private var presenter: ResultPresenterInput!
    func inject(presenter: ResultPresenterInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        originalTextView.text = presenter.original
        convertedTextView.text = presenter.converted
    }

    @IBAction func tabClose(_ sender: Any) {
        self.dismiss(animated: true)
    }

}

extension ResultViewController: ResultPresenterOutput {}
