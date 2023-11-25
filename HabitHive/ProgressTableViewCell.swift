//
//  ProgressTableViewCell.swift
//  HabitHive
//
//  Created by Мария Нестерова on 15.11.2023.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    private lazy var backgroundCellView: UIView = {
        let backgroundCellView = UIView()
        backgroundCellView.backgroundColor = .systemBackground
        backgroundCellView.layer.cornerRadius = 8
        
        return backgroundCellView
    }()
    
    private lazy var motivatingLabel: UILabel = {
        let motivatingLabel = UILabel()
        motivatingLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        motivatingLabel.textColor = .systemGray2
        motivatingLabel.text = "Все получится!"
        
        return motivatingLabel
    }()
    
    private lazy var percentLabel: UILabel = {
        let percentLabel = UILabel()
        percentLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        percentLabel.textColor = .systemGray2
        percentLabel.text = "30%"
        
        return percentLabel
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        
        return progressView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        
        update()
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(motivatingLabel)
        backgroundCellView.addSubview(percentLabel)
        backgroundCellView.addSubview(progressView)
        
        backgroundCellView.translatesAutoresizingMaskIntoConstraints = false
        for view in backgroundCellView.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backgroundCellView.heightAnchor.constraint(equalToConstant: 60),
            backgroundCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            backgroundCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backgroundCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            motivatingLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 10),
            motivatingLabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 12),
            percentLabel.topAnchor.constraint(equalTo: motivatingLabel.topAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -12),
            progressView.topAnchor.constraint(equalTo: motivatingLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: motivatingLabel.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: percentLabel.trailingAnchor)
        ])
    }
    
    func update() {
        let habitStore = HabitsStore.shared
        percentLabel.text = "\(Int(habitStore.todayProgress * 100))%"
        progressView.progress = habitStore.todayProgress
    }
    
}
