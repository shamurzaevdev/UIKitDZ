//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

/// Just Our Demo Application

final class DemoAppViewController: UIViewController {

    // MARK: - Private properties
    private var addTextBarButton = UIBarButtonItem()
    private let colors: [UIColor] = [.black, .white]
    private let lines = [0, 1, 2]
    private let textOfColors = ["Black", "White"]
    private let shadowSwitcher = UISwitch()
    private let lineBreakSwitcher = UISwitch()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 100, width: 345, height: 233)
        label.textAlignment = .center
        label.backgroundColor = .systemGray4
        label.shadowColor = .black
        return label
    }()

    private lazy var sizeSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 20, y: 400, width: 345, height: 23)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 30
        slider.tintColor = .black
        slider.addTarget(self, action: #selector(changeSizeAction), for: .valueChanged)
        return slider
    }()

    private let colorPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 20, y: 500, width: 100, height: 45)
        picker.backgroundColor = .systemGray2
        picker.tag = 1
        return picker
    }()

    private let numberLinesPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 210, y: 500, width: 100, height: 45)
        picker.backgroundColor = .systemGray2
        picker.tag = 2
        return picker
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .gray
        view.addSubview(textLabel)
        setAddButton()
        view.addSubview(sizeSlider)
        view.addSubview(colorPicker)
        colorPicker.dataSource = self
        colorPicker.delegate = self
        numberLinesPicker.dataSource = self
        numberLinesPicker.delegate = self
        view.addSubview(numberLinesPicker)
        createSwitch()
    }

    private func createSwitch() {
        shadowSwitcher.frame = CGRect(x: 80, y: 600, width: 0, height: 0)
        shadowSwitcher.addTarget(self, action: #selector(changeShadowAction), for: .valueChanged)
        shadowSwitcher.isOn = true
            view.addSubview(shadowSwitcher)

        lineBreakSwitcher.frame = CGRect(x: 280, y: 600, width: 0, height: 0)
        lineBreakSwitcher.addTarget(self, action: #selector(breakLinesAction), for: .valueChanged)
        lineBreakSwitcher.isOn = true
            view.addSubview(lineBreakSwitcher)
        }

    private func setAddButton() {
        addTextBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                               style: .plain, target: self, action: #selector(addAction))
            navigationItem.rightBarButtonItem = addTextBarButton
        addTextBarButton.tintColor = UIColor.black
        }

    // MARK: - Objc methods
    @objc private func addAction(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Text",
                                                message: "Please Enter the text",
                                                preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: "Click", style: .default) { _ in
            self.textLabel.text = alertController.textFields?.first?.text ?? ""
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }

    @objc private func changeSizeAction(sender: UISlider) {
        textLabel.font = .systemFont(ofSize: CGFloat(sender.value))
    }

    @objc private func breakLinesAction() {
            if lineBreakSwitcher.isOn {
                textLabel.lineBreakMode = .byWordWrapping
            } else {
                textLabel.lineBreakMode = .byCharWrapping
            }
        }

    @objc private func changeShadowAction() {
            if shadowSwitcher.isOn {
                textLabel.shadowOffset = CGSize(width: 2, height: 3)
            } else {
                textLabel.shadowOffset = CGSize(width: 0, height: 0)
            }
        }
}

extension DemoAppViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return colors.count
        case 2:
            return lines.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return textOfColors[row]
        case 2:
            return String(lines[row])
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            textLabel.textColor = colors[row]
        case 2:
            textLabel.numberOfLines = lines[row]
        default:
            break
        }
    }
}
