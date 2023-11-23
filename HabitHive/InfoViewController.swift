//
//  InfoViewController.swift
//  HabitHive
//
//  Created by Мария Нестерова on 14.11.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = view.safeAreaInsets
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        return contentView
    }()
    
    private lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        infoLabel.text = "Привычка за 21 день"
        
        return infoLabel
    }()
    
    private lazy var infoText: UILabel = {
        let infoText = UILabel()
        infoText.font = .systemFont(ofSize: 17, weight: .regular)
        infoText.numberOfLines = 0
        infoText.textAlignment = .natural
        infoText.text = """
    Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:
    
    1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.
    
    2. Выдержать 2 дня в прежнем состоянии самоконтроля.
    
    3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.
    
    4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.
    
    5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.
    
    6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.
    """
        
        return infoText
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Информация"
        setup()
    }
    
    private func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(infoText)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        for view in contentView.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -22),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoText.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            infoText.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infoText.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            infoText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
