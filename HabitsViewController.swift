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

        let addHabitButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabitButtonTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Сегодня"
        addHabitButtonItem.tintColor = .accent
        navigationItem.rightBarButtonItem = addHabitButtonItem
        view.backgroundColor = .sunset
    }
    
    @objc private func addHabitButtonTapped(_ sender: UIButton) {
        print("Add habit button tapped")
    }

}
