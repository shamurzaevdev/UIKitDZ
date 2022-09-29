//
//  BirthDayViewController.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit

/// In this class we manage the data related to the date of birth
final class BirthDayViewController: UIViewController {

    let persons = BIrthdayViews()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Birthday"
        addNavigationItem()
        addSetup()
    }
    
    func addSetup() {
        view.addSubview(persons.jeremyLabel)
        view.addSubview(persons.jeremyButton)
        view.addSubview(persons.jeremyInfo)
        view.addSubview(persons.jeremyBrthd)
        view.addSubview(persons.mariaLabel)
        view.addSubview(persons.mariaInfo)
        view.addSubview(persons.mariaBrthd)
        view.addSubview(persons.mariaButton)
        view.addSubview(persons.jonyInfo)
        view.addSubview(persons.jonyBrthd)
        view.addSubview(persons.jonyLabel)
        view.addSubview(persons.jonyButton)
    }

    func addNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                       target: self,
                                                                       action: #selector(pushPickersView))
    }

    @objc private func pushPickersView() {
        let dataPickerVC = DataPickerViewController()
        navigationController?.pushViewController(dataPickerVC, animated: true)
    }
}
