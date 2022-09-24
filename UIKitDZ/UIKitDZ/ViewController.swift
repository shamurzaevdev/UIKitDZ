//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit
class ViewController: UIViewController {
    let nameLabel: UILabel = UILabel()
    let digitThree: UILabel = UILabel()
    let whichNumber: UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let additionButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
        additionButton.backgroundColor = .orange
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.addTarget(self, action: #selector(additionAction), for: .touchUpInside)
        let randomNumberButton = UIButton(frame: CGRect(x: 200, y: 100, width: 100, height: 50))
        randomNumberButton.backgroundColor = .orange
        randomNumberButton.setTitle("Угадай число", for: .normal)
        randomNumberButton.addTarget(self, action: #selector(tellTheNumber(sender:)), for: .touchUpInside)
        nameLabel.frame = CGRect(x: 50, y: 170, width: 200, height: 21)
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.text = "Ваше ФИО: "
        digitThree.frame = CGRect(x: 50, y: 270, width: 200, height: 21)
        digitThree.textColor = UIColor.black
        digitThree.textAlignment = NSTextAlignment.center
        whichNumber.frame = CGRect(x: 50, y: 280, width: 200, height: 21)
        whichNumber.textColor = UIColor.black
        whichNumber.textAlignment = NSTextAlignment.center
        view.addSubview(additionButton)
        view.addSubview(randomNumberButton)
        view.addSubview(nameLabel)
        view.addSubview(digitThree)
        view.addSubview(whichNumber)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        promptForAnswer()
    }
    @objc func additionAction(sender: UIButton) {
        let alertController = UIAlertController(title: "Внимание!",
                                                message: "Введите число 1 и число 2",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Посчитать", style: .default) { _ in
            self.digitThree.text = "1 + 2 = 3"
        }
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    @objc func tellTheNumber(sender: UIButton) {
        let alertController = UIAlertController(title: "Отгадай число!",
                                                message: "Которое будет если нажать кнопку сложение?",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Ввести число", style: .default) { _ in
            let text = alertController.textFields?.first
            if self.whichNumber.text != nil {
                var localText = self.whichNumber.text!
                localText += text?.text ?? ""
                let checkDigit = Int(localText)
                if checkDigit != 3 {
                    self.whichNumber.text = "NE PRAVILNO!"
                } else if checkDigit == 3 {
                    self.whichNumber.text = "PRAVILNO! 3!!!"
                }
            }
        }
        alertController.addTextField { textField in
            self.whichNumber.text = textField.text
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    func promptForAnswer() {
        let alertController = UIAlertController(title: "Введите Ваше", message: "ФИО", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            let text = alertController.textFields?.first
            self.nameLabel.text! += text?.text ?? ""
        }
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
