//
//  HomeViewController.swift
//  Swift-Twitter
//
//  Created by 王杰 on 2022/9/18.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var modelTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableview.dataSource = self
        tableview.delegate = self
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(modelTableView)
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        modelTableView.frame = view.frame
    }

}

//MARK: - 自定义方法
extension HomeViewController {
    private func configureNavigationBar() {
        
         let logoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "TwitterIcon")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        navigationItem.titleView = logoImageView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(didTapProfile))
    }
    @objc func didTapProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
}

extension HomeViewController: TweetTableViewCellDelegate {
    func TweetTableViewCellTapReply() {
        print("reply")
    }
    
    func TweetTableViewCellTapRetweet() {
        print("retweet")
    }
    
    func TweetTableViewCellTaplike() {
        print("like")
    }
    
    func TweetTableViewCellTapShare() {
        print("share")
    }
    
    
}

//MARK: - UITableViewDelegate + UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }

}
