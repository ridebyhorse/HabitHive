//
//  HabitTableViewCell.swift
//  HabitHive
//
//  Created by Мария Нестерова on 15.11.2023.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    private lazy var backgroundCellView: UIView = {
        let backgroundCellView = UIView()
        backgroundCellView.backgroundColor = .systemBackground
        backgroundCellView.layer.cornerRadius = 8
        
        return backgroundCellView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.numberOfLines = 2
        nameLabel.text = "Название привычки"
        
        return nameLabel
    }()
    
    private lazy var periodicityLabel: UILabel = {
        let periodicityLabel = UILabel()
        periodicityLabel.font = .systemFont(ofSize: 12, weight: .regular)
        periodicityLabel.text = "Каждый день в "
        
        return periodicityLabel
    }()
    
    private lazy var counterLabel: UILabel = {
        let counterLabel = UILabel()
        counterLabel.font = .systemFont(ofSize: 13, weight: .regular)
        counterLabel.text = "Счетчик: "
        
        return counterLabel
    }()
    
    private lazy var checkBackgroundView: UIView = {
        let checkBackgroundView = UIView()
        checkBackgroundView.layer.borderWidth = 2
        checkBackgroundView.backgroundColor = .systemGray2
        
        return checkBackgroundView
    }()
    
    private lazy var checkImageView: UIImageView = {
        let checkImageView = UIImageView()
        let largeTitle = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let black = UIImage.SymbolConfiguration(weight: .black)
        let combined = largeTitle.applying(black)
        checkImageView.image = UIImage(systemName: "checkmark", withConfiguration: combined)
        checkImageView.tintColor = .systemBackground
        
        return checkImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6

        update()
        setup()
        layoutIfNeeded()
        
        checkBackgroundView.layer.cornerRadius = checkBackgroundView.frame.width / 2
        checkBackgroundView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(nameLabel)
        backgroundCellView.addSubview(periodicityLabel)
        backgroundCellView.addSubview(counterLabel)
        backgroundCellView.addSubview(checkBackgroundView)
        checkBackgroundView.addSubview(checkImageView)
        
        backgroundCellView.translatesAutoresizingMaskIntoConstraints = false
        for view in backgroundCellView.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        checkImageView.translatesAutoresizingMaskIntoConstraints = false

        let backgroundViewHeightConstraint = backgroundCellView.heightAnchor.constraint(equalToConstant: 130)
        backgroundViewHeightConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            backgroundViewHeightConstraint,
            backgroundCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            backgroundCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backgroundCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            checkBackgroundView.widthAnchor.constraint(equalToConstant: 40),
            checkBackgroundView.heightAnchor.constraint(equalTo: checkBackgroundView.widthAnchor),
            checkBackgroundView.centerYAnchor.constraint(equalTo: backgroundCellView.centerYAnchor),
            checkBackgroundView.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -25),
            checkImageView.topAnchor.constraint(equalTo: checkBackgroundView.topAnchor, constant: 9),
            checkImageView.leadingAnchor.constraint(equalTo: checkBackgroundView.leadingAnchor, constant: 8),
            checkImageView.trailingAnchor.constraint(equalTo: checkBackgroundView.trailingAnchor, constant: -8),
            checkImageView.bottomAnchor.constraint(equalTo: checkBackgroundView.bottomAnchor, constant: -9),
            nameLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: checkBackgroundView.leadingAnchor, constant: -40),
            periodicityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            periodicityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            periodicityLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -20),
            counterLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            
        ])
        
    }
    
    private func update() {
        
    }

}
