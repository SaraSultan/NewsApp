//
//  NewsFeedViewController.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import UIKit
import ProgressHUD
import UIScrollView_InfiniteScroll

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var newsFeedsSearchBar: UISearchBar!
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    private var viewModel : NewsFeedsViewModel = NewsFeedsViewModel()
    private var isSearching = true
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News"
        configureProgress()
        configureTableView()
    }
    
    // MARK: - Configuration
    
    private func configureProgress() {
        ProgressHUD.animationType = .lineScaling
        ProgressHUD.colorHUD = .systemGray
        ProgressHUD.colorBackground = .lightGray
        ProgressHUD.colorAnimation = .systemBlue
        ProgressHUD.colorProgress = .systemBlue
        ProgressHUD.fontStatus = UIFont(name: "HelveticaNeue-Regular", size: 18) ?? .boldSystemFont(ofSize: 18)
        
        let defaultImageConfiguration = UIImage.SymbolConfiguration(scale: .large)
        if let successImage = UIImage(systemName: "checkmark.circle", withConfiguration: defaultImageConfiguration) {
            ProgressHUD.imageSuccess = successImage
        }
        if let faildImage = UIImage(systemName: "xmark.octagon", withConfiguration: defaultImageConfiguration) {
            ProgressHUD.imageError = faildImage
        }
    }

    private func configureTableView() {
        newsFeedTableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        
        newsFeedTableView.addInfiniteScroll { [weak self] (tableView) in
            self?.viewModel.currentPage += 1
            self?.isSearching = false
            self?.loadData()
        }
    }
    
    private func configureSearchBar() {
        newsFeedsSearchBar.becomeFirstResponder()
        newsFeedsSearchBar.delegate = self
        newsFeedsSearchBar.searchTextField.delegate = self
    }
    
    private func dismissSuccessProgress(){
        ProgressHUD.dismiss()
        ProgressHUD.colorStatus = .systemBlue
        ProgressHUD.show(icon: .succeed)
    }
    
    private func dismissFailureProgress(_ errorString : String){
        ProgressHUD.colorStatus = .systemRed
        ProgressHUD.showError(errorString, image: nil, interaction: true)
    }
    
    @objc
    private func loadData() {
        if isSearching { ProgressHUD.show() }
        viewModel.loadNewsFeedsPage() { [weak self] in
            if self?.isSearching ?? false {
                self?.dismissSuccessProgress()
            }
            self?.newsFeedTableView.reloadData()
            self?.newsFeedTableView.finishInfiniteScroll()
        } withFailure: { [weak self]  errorString in
            self?.dismissFailureProgress(errorString)
            self?.newsFeedTableView.finishInfiniteScroll()
        }
    }
}

extension NewsFeedViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.query = searchText
        viewModel.currentPage = 1
        isSearching = true
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(loadData), object: nil)
        self.perform(#selector(loadData), with: nil, afterDelay: 1)
    }
}

extension NewsFeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        viewModel.currentPage = 1
        isSearching = true
        loadData()
        return true
    }
}

extension NewsFeedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

extension NewsFeedViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        guard let cell = newsFeedTableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier(), for: indexPath) as? CellConfigurable else { return UITableViewCell() }
        cell.setUp(model: cellViewModel)
        return cell
    }
}

extension NewsFeedViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
