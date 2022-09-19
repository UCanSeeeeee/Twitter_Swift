//
//  TweetTableViewCell.swift
//  Swift-Twitter
//
//  Created by 王杰 on 2022/9/19.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func TweetTableViewCellTapReply()
    func TweetTableViewCellTapRetweet()
    func TweetTableViewCellTaplike()
    func TweetTableViewCellTapShare()
}

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    weak var delegate: TweetTableViewCellDelegate?
    
    private let headImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let dispalyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "@id"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tweetWordsLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the best movie ever to watch as a kid! This is the best movie ever to watch as a kid! This is the best movie ever to watch as a kid!"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ReplyIcon"), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "RetweetIcon"), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "LikeIcon"), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ShareIcon"), for: .normal)
        button.tintColor = .systemGray2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(headImageView)
        contentView.addSubview(dispalyNameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(tweetWordsLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        configureConstraints()
        configureButton()
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

//MARK: - 自定义方法
extension TweetTableViewCell {
    
    @objc private func didTapReply() {
        delegate?.TweetTableViewCellTapReply()
    }
    @objc private func didTapRetweet() {
        delegate?.TweetTableViewCellTapRetweet()
    }
    @objc private func didTapLike() {
        delegate?.TweetTableViewCellTaplike()
    }
    @objc private func didTapShare() {
        delegate?.TweetTableViewCellTapShare()
    }
    
    private func configureButton() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }
    
    private func configureConstraints() {
        
        headImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(20)
            make.top.equalTo(contentView.snp.top).offset(14)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        dispalyNameLabel.snp.makeConstraints { make in
            make.left.equalTo(headImageView.snp.right).offset(20)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.left.equalTo(dispalyNameLabel.snp.right).offset(10)
            make.centerY.equalTo(dispalyNameLabel.snp.centerY)
        }

        tweetWordsLabel.snp.makeConstraints { make in
            make.top.equalTo(dispalyNameLabel.snp.bottom)
            make.left.equalTo(dispalyNameLabel.snp.left)
            make.right.equalTo(contentView.snp.right).offset(-15)
        }
        
        replyButton.snp.makeConstraints { make in
            make.top.equalTo(tweetWordsLabel.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
            make.left.equalTo(tweetWordsLabel.snp.left)
        }
        
        layoutIfNeeded()
        
        retweetButton.snp.makeConstraints { make in
            make.left.equalTo(replyButton.snp.right).offset((tweetWordsLabel.frame.width - (replyButton.frame.width) * 4) / 3)
            make.centerY.equalTo(replyButton.snp.centerY)
        }
        
        likeButton.snp.makeConstraints { make in
            make.left.equalTo(retweetButton.snp.right).offset((tweetWordsLabel.frame.width - (replyButton.frame.width) * 4) / 3)
            make.centerY.equalTo(replyButton.snp.centerY)
        }
        
        shareButton.snp.makeConstraints { make in
            make.left.equalTo(likeButton.snp.right).offset((tweetWordsLabel.frame.width - (replyButton.frame.width) * 4) / 3)
            make.centerY.equalTo(replyButton.snp.centerY)
        }
    }
}
