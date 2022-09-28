//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by Эл on 28.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 50, y: 200, width: 70, height: 30)
            label.textColor = .black
            label.text = "Email"
            return label
        }()

    // Create password label
        let passwordLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 50, y: 270, width: 100, height: 30)
            label.textColor = .black
            label.text = "Password"
            return label
        }()

    // Create textField for Login
        let textFielddLogin: UITextField = {
           let textField = UITextField()
            textField.frame = CGRect(x: 50, y: 230, width: 150, height: 30)
            textField.placeholder = "Enter your login"
            textField.keyboardType = .default
            textField.returnKeyType = .done
            textField.autocorrectionType = .no
            textField.font = .systemFont(ofSize: 13)
            textField.borderStyle = .roundedRect
            textField.clearButtonMode = .whileEditing
            textField.contentVerticalAlignment = .center
            return textField
        }()

    // Create textField for Password
        let textFielddPassword: UITextField = {
           let textField = UITextField()
            textField.frame = CGRect(x: 50, y: 300, width: 150, height: 30)
            textField.placeholder = "Enter your password"
            textField.keyboardType = .default
            textField.returnKeyType = .done
            textField.autocorrectionType = .no
            textField.font = .systemFont(ofSize: 13)
            textField.borderStyle = .roundedRect
            textField.clearButtonMode = .whileEditing
            textField.contentVerticalAlignment = .center
            textField.isSecureTextEntry = true
            return textField
        }()

    // Create login Button
        let loginButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
            button.setTitle("Login", for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = 6.0
            button.setTitleColor(.white, for: .normal)
            button.setTitleColor(.black, for: .highlighted)
            return button
        }()

        lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 90, width: 150, height: 100)
            imageView.center.x = view.center.x
            imageView.image = UIImage(named: "LVlogo")
            return imageView
        }()

        let faceIdLogin: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 70, y: 350, width: 200, height: 50)
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 15)
            label.textAlignment = .center
            label.text = "Login with FaceID"
            return label
        }()

        let faceIdIsOn: UISwitch = {
            let switcher = UISwitch()
            switcher.frame = CGRect(x: 250, y: 360, width: 0, height: 0)
            switcher.isOn = true
            return switcher
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
    }
    
    private func setupUI() {
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(textFielddLogin)
        view.addSubview(textFielddPassword)
        view.addSubview(loginButton)
        view.addSubview(imageView)
        view.addSubview(faceIdLogin)
        view.addSubview(faceIdIsOn)
        view.backgroundColor = .white
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
    }
    
    @objc func loginAction(sender: UIButton) {
            // We have to push a Birthday View Controller
            let segmentedController = SegmentedViewController()
            segmentedController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back",
                                                                          style: .plain,
                                                                          target: self,
                                                                          action: #selector(dismissSelf))
            let navVC = UINavigationController(rootViewController: segmentedController)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }

        @objc private func dismissSelf() {
            dismiss(animated: true, completion: nil)
        }
}
