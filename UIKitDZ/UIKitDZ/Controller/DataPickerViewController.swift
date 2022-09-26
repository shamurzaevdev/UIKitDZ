//
//  DataPickerViewController.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit

class DataPickerViewController: UIViewController {

    let dataPickerviews = DataPickerViews()
    let dataPickerData = DataPickerData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        addInfo()
    }

    func setupView() {
        view.addSubview(dataPickerviews.nameLabel)
        view.addSubview(dataPickerviews.nameTextField)
        view.addSubview(dataPickerviews.personImage)
        view.addSubview(dataPickerviews.changePhotoLabel)
        view.addSubview(dataPickerviews.ageLabel)
        view.addSubview(dataPickerviews.ageTextField)
        view.addSubview(dataPickerviews.dateLabel)
        view.addSubview(dataPickerviews.dateTextField)
        view.addSubview(dataPickerviews.genderLabel)
        view.addSubview(dataPickerviews.genderTextField)
        view.addSubview(dataPickerviews.instagramLabel)
        view.addSubview(dataPickerviews.instagramTextField)
        dataPickerData.agePicker.delegate = self
        dataPickerData.agePicker.dataSource = self
        dataPickerData.genderPicker.delegate = self
        dataPickerData.genderPicker.dataSource = self
        dataPickerviews.instagramTextField.delegate = self
        dataPickerviews.ageTextField.inputView = dataPickerData.agePicker
        dataPickerviews.genderTextField.inputView = dataPickerData.genderPicker
        dataPickerData.agePicker.tag = 1
        dataPickerData.genderPicker.tag = 2
        createDatePicker()
    }

    func addInfo() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(pushBirthdayListAction))

        }

    @objc private func pushBirthdayListAction() {
            let addPerson = BirthDayViewController()
            self.navigationController?.pushViewController(addPerson, animated: true)
        }

    func createDatePicker() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedAction))
            toolBar.setItems([doneBtn], animated: true)
            dataPickerviews.dateTextField.inputAccessoryView = toolBar
            dataPickerviews.dateTextField.inputView = dataPickerData.datePicker
            dataPickerData.datePicker.datePickerMode = .date
            dataPickerData.datePicker.preferredDatePickerStyle = .wheels
        }
    @objc func donePressedAction() {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            dataPickerviews.dateTextField.text = formatter.string(from: dataPickerData.datePicker.date)
            self.view.endEditing(true)
        }
}

extension DataPickerViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
                    return dataPickerData.ages.count
        case 2:
                    return dataPickerData.genders.count
        default:
                    return 0
                }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView.tag {
            case 1:
                return "\(dataPickerData.ages[row])"
            case 2:
                return dataPickerData.genders[row]
            default:
                return "ERROR"
            }
        }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch pickerView.tag {
            case 1:
                dataPickerviews.ageTextField.text = "\(dataPickerData.ages[row])"
                dataPickerviews.ageTextField.resignFirstResponder()
            case 2:
                dataPickerviews.genderTextField.text = dataPickerData.genders[row]
                dataPickerviews.genderTextField.resignFirstResponder()
            default:
                return
            }
        }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            let alert = UIAlertController(title: "", message: "Введите инстаграм", preferredStyle: .alert)
            let alertControllerAction = UIAlertAction(title: "OK", style: .default) { _ in
                guard let text = alert.textFields?.first?.text else {
                    return
                }
                self.dataPickerviews.instagramTextField.text = text
            }

            alert.addAction(alertControllerAction)
            alert.addTextField()

            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))

            self.present(alert, animated: true)

            return true
        }
}
