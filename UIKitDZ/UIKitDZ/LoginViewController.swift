//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

/// The controller which contains the views and body for log in to the system

final class LoginViewController: UIViewController {

    // MARK: - Properties
    let logoImageView: UIImageView = {
        var imageView = UIImageView(frame: CGRect(
            x: 0,
            y: 130,
            width: 170,
            height: 170))
        imageView.image = UIImage(named: "hatimakiLogo")
        return imageView
    }()

    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    let registrationButton = UIButton()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingViewController()
    }
    // MARK: - Public Methods
    func settingViewController() {
        logoImageView.center.x = view.center.x
        view.addSubview(logoImageView)
        setTextField()
        setLabels()
        setButtons()
    }

    func setTextField() {
        emailTextField.placeholder = "Enter phone number"
        emailTextField.keyboardType = .numberPad
        emailTextField.frame = CGRect(x: 30, y: 390, width: 350, height: 35)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)

        passwordTextField.placeholder = "Enter the password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 30, y: 480, width: 350, height: 35)
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
    }

    func setLabels() {
        emailLabel.text = "Phone number"
        emailLabel.frame = CGRect(x: 30, y: 350, width: 150, height: 50)
        emailLabel.textColor = .red
        emailLabel.font = .boldSystemFont(ofSize: 17)
        view.addSubview(emailLabel)

        passwordLabel.text = "Password"
        passwordLabel.frame = CGRect(x: 30, y: 440, width: 350, height: 50)
        passwordLabel.textColor = .red
        passwordLabel.font = .boldSystemFont(ofSize: 17)
        view.addSubview(passwordLabel)

    }

    func setButtons() {
        signInButton.setTitle("Login", for: .normal)
        signInButton.backgroundColor = .red
        signInButton.frame = CGRect(x: 0, y: 570, width: 280, height: 50)
        signInButton.center.x = view.center.x
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
        view.addSubview(signInButton)

        registrationButton.setTitle("Sign in", for: .normal)
        registrationButton.backgroundColor = .red
        registrationButton.frame = CGRect(x: 0, y: 650, width: 280, height: 50)
        registrationButton.center.x = view.center.x
        registrationButton.layer.cornerRadius = 15
        registrationButton.clipsToBounds = true
        view.addSubview(registrationButton)

    }

    // MARK: - @objc actions
    @objc private func tapSignInButton() {
        let foodViewController = MenuViewController()
        let navVC = UINavigationController(rootViewController: foodViewController)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false)
    }
}
