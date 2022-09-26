//
//  BirthDayViewController.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit

class BirthDayViewController: UIViewController {

    let persons = BIrthdayViews()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Birthday"
        addPerson()
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

    func addPerson() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                       target: self,
                                                                       action: #selector(pushPickersView))
    }

    @objc private func pushPickersView() {
        let dataPickerVC = DataPickerViewController()
        navigationController?.pushViewController(dataPickerVC, animated: true)
    }
}
