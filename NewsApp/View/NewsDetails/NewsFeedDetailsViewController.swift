//
//  NewsFeedDetailsViewController.swift
//  NewsApp
//
//  Created by Sara Sultan on 02/03/2022.
//

import UIKit
import SafariServices

class NewsFeedDetailsViewController: UIViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    
    var viewModel: NewsFeedDetailsViewModelProtocol?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News Details"
        viewModel?.prepareCellViewModels()
        configureTableView()
    }
    
    private func configureTableView() {
        guard let vm = viewModel as? NewsFeedDetailsViewModel else { return }
        guard let cellViewModels = vm.cellViewModels else { return }
        
        for cellViewModel in cellViewModels {
            detailsTableView.register(UINib(nibName: cellViewModel.cellIdentifier(), bundle: nil),
                                      forCellReuseIdentifier: cellViewModel.cellIdentifier())
        }
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
    
    
    func getCellViewModels() -> [BaseCellViewModel]? {
        if let vm = viewModel as? NewsFeedDetailsViewModel {
            if let cellViewModels = vm.cellViewModels {
                return cellViewModels
            }
        }
        return nil
    }
}

extension NewsFeedDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCellViewModels()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModels = getCellViewModels() else { return UITableViewCell() }
        
        let cellViewModel = cellViewModels[indexPath.row]
        guard let cell = detailsTableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier(), for: indexPath) as? CellConfigurable else { return UITableViewCell() }
        
        cell.setUp(model: cellViewModel)
        return cell
    }
}

extension NewsFeedDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModels = getCellViewModels() else { return }

        let cellViewModel = cellViewModels[indexPath.row]
        if let cellVM = cellViewModel as? ActionKeyValueCellViewModel , let url = cellVM.url {
            let safariViewcontroller = SFSafariViewController(url: url)
            present(safariViewcontroller, animated: true, completion: nil)
        }
    
    }
}
