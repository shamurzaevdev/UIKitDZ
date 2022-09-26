//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

let elements = GlobalUiElements()

class LoginViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
        elements.loginButton.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
    }

    func setUpViews() {
        view.addSubview(elements.loginLabel)
        view.addSubview(elements.passwordLabel)
        view.addSubview(elements.textFielddLogin)
        view.addSubview(elements.textFielddPassword)
        view.addSubview(elements.loginButton)
        view.addSubview(elements.birthDayReminder)
        view.addSubview(elements.signInLabel)
        view.addSubview(elements.faceIdLogin)
        view.addSubview(elements.faceIdIsOn)
        elements.textFielddLogin.delegate = self
        navigationController?.navigationBar.barTintColor = .lightGray
    }
    @objc func loginAction(sender: UIButton) {
        // We have to push a Birthday View Controller
        let birthdayVC = BirthDayViewController()
        birthdayVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back",
                                                                      style: .plain,
                                                                      target: self,
                                                                      action: #selector(dismissSelf))
        let navVC = UINavigationController(rootViewController: birthdayVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
