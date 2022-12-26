//
//  HomeVC.swift
//  Shahnewaz_30020_15Dec
//
//  Created by BJIT on 12/26/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let userPostCellNib = UINib(nibName: Constants.userPostTVCellId, bundle: nil)
        tableView.register(userPostCellNib, forCellReuseIdentifier: Constants.userPostTVCellId)

    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postCell = tableView.dequeueReusableCell(withIdentifier: Constants.userPostTVCellId, for: indexPath) as! UserPostTVCell
        
        return postCell
    }
}

extension HomeVC: UITableViewDelegate {
    
}
