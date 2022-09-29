//
//  UiElementsView.swift
//  UIKitDZ
//
//  Created by Эл on 25.09.2022.
//

import UIKit

/// This is a class where we initialize our UI elements

final class GlobalUiElements: UIView {

// Create login label

    let loginLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 70, height: 30)
        label.textColor = .blue
        label.text = "Email"
        return label
    }()

// Create password label

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 270, width: 100, height: 30)
        label.textColor = .blue
        label.text = "Password"
        return label
    }()

// Create textField for Login

    let loginTextField: UITextField = {
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

    let passwordTextField: UITextField = {
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
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6.0
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        return button
    }()

    let birthDayReminderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 70, width: 200, height: 50)
        label.textColor = .blue
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        label.textAlignment = .center
        label.text = "Birthday Reminder"
        return label
    }()

    let signInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: -10, y: 150, width: 200, height: 50)
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Sign In"
        return label
    }()

    let faceIdLoginLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 350, width: 200, height: 50)
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "Login with FaceID"
        return label
    }()

    let faceIdISwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 250, y: 360, width: 0, height: 0)
        switcher.isOn = true
        return switcher
    }()
}
