//
//  ProfileViewController.swift
//  Swift-Twitter
//
//  Created by 王杰 on 2022/9/19.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var profileTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.addSubview(profileTableView)
        let headview = ProfileHeadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 380))
        profileTableView.tableHeaderView = headview
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileTableView.frame = view.bounds
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
