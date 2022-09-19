//
//  ProfileHeadView.swift
//  Swift-Twitter
//
//  Created by 王杰 on 2022/9/19.
//

import UIKit

class ProfileHeadView: UIView {
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "PhotoFlower")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        label.text = "displayNameLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "@userNameLabel"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweetWordsLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the best movie ever to watch as a kid! This is the best movie ever to watch as a kid!"
        label.numberOfLines = 3
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let joinedDateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .secondaryLabel
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let joinedDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.tintColor = .secondaryLabel
        label.text = "Joined May 2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(headerImageView)
        addSubview(userHeaderImageView)
        addSubview(displayNameLabel)
        addSubview(userNameLabel)
        addSubview(tweetWordsLabel)
        addSubview(joinedDateImageView)
        addSubview(joinedDateLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        headerImageView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(150)
        }
        userHeaderImageView.snp.makeConstraints { make in
            make.centerY.equalTo(headerImageView.snp.bottom)
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        displayNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userHeaderImageView.snp.bottom).offset(20)
            make.left.equalTo(userHeaderImageView.snp.left)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(displayNameLabel.snp.bottom).offset(5)
            make.left.equalTo(userHeaderImageView.snp.left)
        }
        tweetWordsLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(5)
            make.left.equalTo(userHeaderImageView.snp.left)
            make.right.equalTo(self.snp.right).offset(-5)
        }
        joinedDateImageView.snp.makeConstraints { make in
            make.top.equalTo(tweetWordsLabel.snp.bottom).offset(5)
            make.left.equalTo(userHeaderImageView.snp.left)
        }
        joinedDateLabel.snp.makeConstraints { make in
            make.left.equalTo(joinedDateImageView.snp.right).offset(2)
            make.bottom.equalTo(joinedDateImageView.snp.bottom)
        }
    }
    
}
