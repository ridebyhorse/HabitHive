//
//  HabitsViewController.swift
//  HabitHive
//
//  Created by Мария Нестерова on 14.11.2023.
//

import UIKit

class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let addHabitButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabitButtonTapped))
        addHabitButtonItem.tintColor = .accent
        navigationItem.rightBarButtonItem = addHabitButtonItem
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc private func addHabitButtonTapped(_ sender: UIButton) {
        print("Add habit button tapped")
    }

}
