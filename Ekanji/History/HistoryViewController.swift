//
//  HistoryViewController.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private lazy var presenter = HistoryPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HistoryViewController: HistoryPresenterOutput {

    func transitionToResult(original: String, converted: String) {
        let view = ResultViewController()
        let presenter = ResultPresenter(view: view, original: original, converted: converted)
        view.inject(presenter: presenter)
        present(view, animated: true)
    }

}

extension HistoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension HistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfHistories
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.history(forRow: indexPath.row)
        return cell
    }

}
