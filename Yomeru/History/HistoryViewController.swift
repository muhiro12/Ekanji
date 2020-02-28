//
//  HistoryViewController.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/18.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private lazy var presenter = HistoryPresenter(view: self, model: HistoryModel())

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self

        tableView.keyboardDismissMode = .onDrag
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.willAppear()
    }

}

extension HistoryViewController: HistoryPresenterOutput {

    func clearSearchBar() {
        searchBar.text = ""
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    func transitionToResult(original: String, converted: String) {
        let view = ResultViewController()
        let model = ResultModel(original: original, converted: converted)
        let presenter = ResultPresenter(view: view, model: model)
        view.inject(presenter: presenter)

        view.modalPresentationStyle = .fullScreen

        present(view, animated: true)
    }

}

extension HistoryViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.changedSearchBarText(to: searchText)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as? HistoryTableViewCell else {
            return UITableViewCell()
        }
        cell.originalLabel.text = presenter.history(forRow: indexPath.row)?.original
        cell.convertedLabel.text = presenter.history(forRow: indexPath.row)?.converted
        return cell
    }

}
