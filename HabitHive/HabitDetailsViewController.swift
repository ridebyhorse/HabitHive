//
//  HabitDetailsViewController.swift
//  HabitHive
//
//  Created by Мария Нестерова on 24.11.2023.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    fileprivate let cellDetailReuseIdentifier = "HabitDetailReuse"
    
    private var habit: Habit
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editHabitButtonTapped))
        
        navigationController?.navigationBar.prefersLargeTitles = false
        title = habit.name
        setup()

    }
    
    init(habitTapped habit: Habit) {
        self.habit = habit
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellDetailReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func editHabitButtonTapped(_ sender: UIBarButtonItem) {
        print("Edit habit button tapped")
        let habitViewController = HabitViewController()
        habitViewController.navigationItem.title = "Править"
        habitViewController.updateDataToEdit(habit: habit)
        navigationController?.pushViewController(habitViewController, animated: true)
    }

}

extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDetailReuseIdentifier, for: indexPath)
        
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates.reversed()[indexPath.row]) {
            cell.accessoryType = .checkmark
        }
        
        var content = cell.defaultContentConfiguration()
        if let date = HabitsStore.shared.trackDateString(forIndex: (HabitsStore.shared.dates.count - indexPath.row - 1)) {
            content.text = "\(date)"
        }
        
        
        cell.contentConfiguration = content
        return cell
    }
    
}

extension HabitDetailsViewController: UITableViewDelegate {
    
}
