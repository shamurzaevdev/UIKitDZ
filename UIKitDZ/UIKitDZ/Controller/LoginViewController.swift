//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

let elements = GlobalUiElements()


/// This is a class via we manage the data related to login information
final class LoginViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
        elements.loginButton.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
    }

    func setUpViews() {
        view.addSubview(elements.loginLabel)
        view.addSubview(elements.passwordLabel)
        view.addSubview(elements.loginTextField)
        view.addSubview(elements.passwordTextField)
        view.addSubview(elements.loginButton)
        view.addSubview(elements.birthDayReminderLabel)
        view.addSubview(elements.signInLabel)
        view.addSubview(elements.faceIdLoginLabel)
        view.addSubview(elements.faceIdISwitch)
        elements.loginTextField.delegate = self
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
