//
//  HabitTableViewCell.swift
//  HabitHive
//
//  Created by Мария Нестерова on 15.11.2023.
//

import UIKit

protocol HabitTableViewCellDelegate: AnyObject {
    func didTrackHabit()
}

class HabitTableViewCell: UITableViewCell {
    
    private var habitData: Habit!
    
    weak var delegate: HabitTableViewCellDelegate?
    
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
        
        return nameLabel
    }()
    
    private lazy var periodicityLabel: UILabel = {
        let periodicityLabel = UILabel()
        periodicityLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        return periodicityLabel
    }()
    
    private lazy var counterLabel: UILabel = {
        let counterLabel = UILabel()
        counterLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        return counterLabel
    }()
    
    private lazy var trackButton: UIButton = {
        let trackButton = UIButton()
        trackButton.layer.borderWidth = 2
        trackButton.addTarget(self, action: #selector(trackButtonTapped), for: .touchUpInside)
        
        return trackButton
    }()
    
    private lazy var checkImageView: UIImageView = {
        let checkImageView = UIImageView()
        let largeTitle = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        let black = UIImage.SymbolConfiguration(weight: .black)
        let combined = largeTitle.applying(black)
        checkImageView.image = UIImage(systemName: "checkmark", withConfiguration: combined)
        checkImageView.tintColor = .systemBackground
        checkImageView.isUserInteractionEnabled = false
        checkImageView.isHidden = true
        
        return checkImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6

        setup()
        layoutIfNeeded()
        
        trackButton.layer.cornerRadius = trackButton.frame.width / 2
        trackButton.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(backgroundCellView)
        backgroundCellView.addSubview(nameLabel)
        backgroundCellView.addSubview(periodicityLabel)
        backgroundCellView.addSubview(counterLabel)
        backgroundCellView.addSubview(trackButton)
        trackButton.addSubview(checkImageView)
        
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
            trackButton.widthAnchor.constraint(equalToConstant: 40),
            trackButton.heightAnchor.constraint(equalTo: trackButton.widthAnchor),
            trackButton.centerYAnchor.constraint(equalTo: backgroundCellView.centerYAnchor),
            trackButton.trailingAnchor.constraint(equalTo: backgroundCellView.trailingAnchor, constant: -25),
            checkImageView.topAnchor.constraint(equalTo: trackButton.topAnchor, constant: 9),
            checkImageView.leadingAnchor.constraint(equalTo: trackButton.leadingAnchor, constant: 8),
            checkImageView.trailingAnchor.constraint(equalTo: trackButton.trailingAnchor, constant: -8),
            checkImageView.bottomAnchor.constraint(equalTo: trackButton.bottomAnchor, constant: -9),
            nameLabel.topAnchor.constraint(equalTo: backgroundCellView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundCellView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trackButton.leadingAnchor, constant: -40),
            periodicityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            periodicityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            periodicityLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            counterLabel.bottomAnchor.constraint(equalTo: backgroundCellView.bottomAnchor, constant: -20),
            counterLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
            
        ])
        
    }
    
    func update(habit: Habit) {
        habitData = habit
        nameLabel.text = habit.name
        periodicityLabel.text = habit.dateString
        counterLabel.text = "Счетчик: \(habit.trackDates.count)"
        trackButton.layer.borderColor = habit.color.cgColor
        if habit.isAlreadyTakenToday {
            trackButton.backgroundColor = habit.color
            checkImageView.isHidden = false
        } else {
            trackButton.backgroundColor = nil
            checkImageView.isHidden = true
        }
        
    }
    
    @objc func trackButtonTapped(_ sender: UIButton) {
        print("Track button tapped")
        guard self.checkImageView.isHidden else { return }
        HabitsStore.shared.track(habitData!)
        delegate?.didTrackHabit()
    }

}
