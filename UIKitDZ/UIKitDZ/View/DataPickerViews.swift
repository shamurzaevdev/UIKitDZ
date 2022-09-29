//
//  DataPickerViews.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit

final class DataPickerViews: UIView {

    let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Имя"
            label.textColor = .systemBlue
            label.frame = CGRect(x: 30, y: 300, width: 70, height: 20)
            return label
        }()

    let nameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Введите имя"
            textField.frame = CGRect(x: 30, y: 325, width: 250, height: 25)
            return textField
        }()

    let personImage: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
            button.tintColor = .systemGray
            button.frame = CGRect(x: 130, y: 50, width: 150, height: 150)
            return button
        }()

    let changePhotoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 110, y: 180, width: 200, height: 50)
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "Change Photo"
        return label
    }()

    let dateLabel: UILabel = {
            let label = UILabel()
            label.text = "Дата"
            label.textColor = .systemBlue
            label.frame = CGRect(x: 30, y: 370, width: 70, height: 20)
            return label
        }()

    let dateTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Введите дату"
            textField.frame = CGRect(x: 30, y: 395, width: 250, height: 25)
            return textField
        }()

    let ageLabel: UILabel = {
            let label = UILabel()
            label.text = "Возраст"
            label.textColor = .systemBlue
            label.frame = CGRect(x: 30, y: 440, width: 70, height: 20)
            return label
        }()

    let ageTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Добавить"
            textField.frame = CGRect(x: 30, y: 465, width: 250, height: 25)
            return textField
        }()

    let genderLabel: UILabel = {
            let label = UILabel()
            label.text = "Пол"
            label.textColor = .systemBlue
            label.frame = CGRect(x: 30, y: 510, width: 70, height: 20)
            return label
        }()

        let genderTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Добавить"
            textField.frame = CGRect(x: 30, y: 535, width: 250, height: 25)
            return textField
        }()

        let instagramLabel: UILabel = {
            let label = UILabel()
            label.text = "Instagram"
            label.textColor = .systemBlue
            label.frame = CGRect(x: 30, y: 580, width: 100, height: 20)
            return label
        }()

        let instagramTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Добавить"
            textField.frame = CGRect(x: 30, y: 605, width: 250, height: 25)
            return textField
        }()
}
