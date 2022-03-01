//
//  NewsFeedViewController.swift
//  NewsApp
//
//  Created by Sara Sultan on 01/03/2022.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var newsFeedsSearchBar: UISearchBar!
    @IBOutlet weak var newsFeedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
    }
    

}
extension NewsFeedViewController : UISearchBarDelegate {
    
}
extension NewsFeedViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
extension NewsFeedViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
