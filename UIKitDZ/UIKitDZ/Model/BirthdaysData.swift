//
//  BirthdaysData.swift
//  UIKitDZ
//
//  Created by Эл on 25.09.2022.
//

import UIKit

/// Get data from class for DataPickerViewController

final class DataPickerData: UIPickerView {
    let datePicker = UIDatePicker()
    let ages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    let genders = ["Мужчина", "Женщина"]
}
