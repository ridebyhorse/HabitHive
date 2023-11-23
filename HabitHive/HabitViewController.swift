//
//  HabitViewController.swift
//  HabitHive
//
//  Created by Мария Нестерова on 21.11.2023.
//

import UIKit

class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return dateFormatter
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        nameLabel.text = "НАЗВАНИЕ"
        
        return nameLabel
    }()
    
    private lazy var nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.font = .systemFont(ofSize: 17, weight: .regular)
        nameTextField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        
        return nameTextField
    }()
    
    private lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        colorLabel.text = "ЦВЕТ"
        
        return colorLabel
    }()
    
    private lazy var colorButton: UIButton = {
        let colorButton = UIButton()
        colorButton.backgroundColor = .accent
        colorButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        
        return colorButton
    }()
    
    private lazy var colorPicker: UIColorPickerViewController = {
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Цвет привычки"
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceView = colorButton
        colorPicker.delegate = self
        
        return colorPicker
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        timeLabel.text = "ВРЕМЯ"
        
        return timeLabel
    }()
    
    private lazy var timeDescriptionLabel: UILabel = {
        let timeDescriptionLabel = UILabel()
        timeDescriptionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        timeDescriptionLabel.text = "Каждый день в "
        
        return timeDescriptionLabel
    }()
    
    private lazy var settingTimeLabel: UILabel = {
        let settingTimeLabel = UILabel()
        settingTimeLabel.font = .systemFont(ofSize: 17, weight: .regular)
        settingTimeLabel.textColor = .accent
        settingTimeLabel.text = dateFormatter.string(from: Date.now)
        
        return settingTimeLabel
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.date = .now
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeSelected), for: .valueChanged)
        
        return timePicker
    }()
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorButton.backgroundColor = viewController.selectedColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Создать"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelHabitCreatingButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveHabitButtonTapped))
        
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        colorButton.layer.cornerRadius = colorButton.frame.width / 2
        colorButton.clipsToBounds = true
    }
    
    private func setup() {
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorButton)
        view.addSubview(timeLabel)
        view.addSubview(timeDescriptionLabel)
        view.addSubview(settingTimeLabel)
        view.addSubview(timePicker)
        
        for view in view.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            colorLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            colorLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            colorLabel.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            colorButton.heightAnchor.constraint(equalTo: colorButton.widthAnchor),
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 6),
            colorButton.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: colorButton.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: colorLabel.trailingAnchor),
            timeDescriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6),
            timeDescriptionLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            settingTimeLabel.topAnchor.constraint(equalTo: timeDescriptionLabel.topAnchor),
            settingTimeLabel.leadingAnchor.constraint(equalTo: timeDescriptionLabel.trailingAnchor),
            settingTimeLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            timePicker.topAnchor.constraint(equalTo: timeDescriptionLabel.bottomAnchor, constant: 6),
            timePicker.leadingAnchor.constraint(equalTo: timeDescriptionLabel.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: settingTimeLabel.trailingAnchor)
            
        ])
    }
    
    @objc private func cancelHabitCreatingButtonTapped(_ sender: UIBarButtonItem) {
        print("Cancel habit creating button tapped")
        navigationController?.dismiss(animated: true) {
            print("Habit creating controller closed")
        }
    }
    
    @objc private func saveHabitButtonTapped(_ sender: UIBarButtonItem) {
        print("Save habit button tapped")
        guard let habitName = nameTextField.text else { return }
        guard !habitName.isEmpty else {
            let alertController = UIAlertController(title: "Введите назвние привычки", message: "Например, 'Бегать по утрам', 'спать 8 часов' и т.п.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true)
            print("Habit name not chosen alert presented")
            return
        }
        guard let habitColor = colorButton.backgroundColor else { return }
        let newHabit = Habit(name: habitName, date: timePicker.date, color: habitColor)
        let habitStore = HabitsStore.shared
        habitStore.habits.append(newHabit)
        navigationController?.dismiss(animated: true) {
            print("Habit creating controller closed")
        }
    }
    
    @objc private func timeSelected(_ sender: UIDatePicker) {
        settingTimeLabel.text = dateFormatter.string(from: sender.date)
    }
    
    @objc private func colorButtonTapped(_ sender: UIButton) {
        print("Color button tapped")
        guard let initialColor = sender.backgroundColor else { return }
        colorPicker.selectedColor = initialColor
        self.present(colorPicker, animated: true)
    }

}
