//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit
/// This class is for login settings
final class LoginViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let emptyText = ""
        static let okText = "OK"
        static let segueId = "login"
        static let unsuccessfulEnterTitle = "Неудачный вход"
        static let unsuccessfulEnterMessage = "Учетная запись не найдена"
        static let registrationTitle = "Учетная запись зарегистрирована"
        static let successEnterTitle = "Успешный вход"
        static let successEnterMessage = "Учетная запись найдена"
        static let UpUIWhenkeyboardWillShow = -200.0
        static let DownUIWhenkeyboardWillShow = 0.0
    }

    // MARK: - IBOutlet

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signinButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    // MARK: - Private properties

    private var users: [UserData] = []
    private var listUsers: [[String]] = []
    private let defaults = UserDefaults.standard

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }

    @IBAction func signinAction(_ sender: UIButton) {
        guard
                let safeNicknameText = loginTextField.text,
                let safeEmailText = emailTextField.text,
                let safePasswordText = passwordTextField.text,
                !safeNicknameText.isEmpty && !safeEmailText.isEmpty && !safePasswordText.isEmpty
                else {
                    return
                }
                users.append(
                    UserData(
                        nicknameUser: safeNicknameText,
                        emailUser: safeEmailText,
                        passwordUser: safePasswordText
                    )
                )
                listUsers.append([safeNicknameText, safeEmailText, safePasswordText])
                self.defaults.set(self.listUsers, forKey: "ListUsers")
                registrationAlert()
                loginTextField.text = Constants.emptyText
                emailTextField.text = Constants.emptyText
                passwordTextField.text = Constants.emptyText
    }

    @IBAction func loginAction(_ sender: UIButton) {
        var userExisting = false
            guard
                let safeNicknameUser = loginTextField.text,
                let safeEmailUser = emailTextField.text,
                let safePasswordUser = passwordTextField.text,
                !safeNicknameUser.isEmpty && !safeEmailUser.isEmpty && !safePasswordUser.isEmpty
            else {
                return
            }
            for userData in listUsers {
                guard
                    userData.count == 3,
                    safeNicknameUser == userData[0],
                    safeEmailUser == userData[1],
                    safePasswordUser == userData[2]
                else {
                    continue
                }
                userExisting = true
            }
            guard
                userExisting
            else {
                unsuccessfulAlert()
                return
            }
            successAlert()
    }

// MARK: - Private Methods

    private func unsuccessfulAlert() {
        let alertController = UIAlertController(
            title: Constants.unsuccessfulEnterTitle,
            message: Constants.unsuccessfulEnterMessage,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

    private func registrationAlert() {
        let alertController = UIAlertController(
            title: Constants.registrationTitle,
            message: Constants.emptyText,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

    private func successAlert() {
        let alertController = UIAlertController(
            title: Constants.successEnterTitle,
            message: Constants.successEnterMessage,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default) { _ in
            self.performSegue(withIdentifier: Constants.segueId, sender: self)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

    private func setDelegate() {
        loginTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func setUserDefaults() {
        if let items = defaults.array(forKey: "ListUsers") as? [[String]] {
            listUsers = items
        }
    }

    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = Constants.UpUIWhenkeyboardWillShow
        }
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = Constants.DownUIWhenkeyboardWillShow
        }
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            switch textField {
            case loginTextField:
                return true
            case emailTextField:
                guard
                    let safeNicknameText = loginTextField.text,
                    safeNicknameText.isEmpty
                else {
                    return true
                }
                return false
            case passwordTextField:
                guard
                    let safeNicknameText = loginTextField.text,
                    let safeEmailText = emailTextField.text,
                    safeNicknameText.isEmpty || safeEmailText.isEmpty
                else {
                    return true
                }
                return false
            default:
                return false
            }
        }
}
