//
//  DynamicArticleTableViewCell.swift
//  UITableViewProject
//
//  Created by Саидов Тимур on 18.02.2022.
//

import UIKit

final class DynamicArticleTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let title: String
        let description: String
        let publishedAt: String
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.backgroundColor = UIColor(hexString: "252525")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Georgia", size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dateTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.dateTitle.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .black

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.dateTitle)
        
        let backViewConstraints = self.backViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()

        NSLayoutConstraint.activate(backViewConstraints + stackViewConstraints)
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10)
        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
}
