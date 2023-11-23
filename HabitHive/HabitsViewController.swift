//
//  HabitsViewController.swift
//  HabitHive
//
//  Created by Мария Нестерова on 14.11.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    fileprivate enum CellReuseIdentifiers: String {
        case progress = "ProgressReuse"
        case habit = "HabitReuse"
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setup()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabitButtonTapped))
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    private func setup() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.register(ProgressTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.progress.rawValue)
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.habit.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @objc private func addHabitButtonTapped(_ sender: UIButton) {

        print("Add habit button tapped")
        let habitViewController = UINavigationController(rootViewController: HabitViewController())
        habitViewController.modalPresentationStyle = .fullScreen
        navigationController?.present(habitViewController, animated: true)
    }

}

extension HabitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        HabitsStore.shared.habits.count + 1
        18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let progressCell: ProgressTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.progress.rawValue) as! ProgressTableViewCell
        let habitCell: HabitTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.habit.rawValue) as! HabitTableViewCell
        if indexPath.row == 0 {
            return progressCell
        } else {
            return habitCell
        }
    }
    
    
}

extension HabitsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Progress cell tapped")
        } else {
            print("Habit cell tapped")
        }
    }
    
}
