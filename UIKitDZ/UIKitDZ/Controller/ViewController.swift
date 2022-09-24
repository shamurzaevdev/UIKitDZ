//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {
    private var viewForButton = View()
    private var model = AlertMessage()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        viewForButton.showViews()
        viewForButton.startButton.addTarget(self, action: #selector(showTheWord(sender:)), for: .touchUpInside)
        view = viewForButton
        view.backgroundColor = .white
    }
    @objc func showTheWord(sender: UIButton) {
        let alertController = UIAlertController(title: "Введите слово:", message: "leohl", preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            if alertController.textFields?.first != nil {
                let text = alertController.textFields?.first!
                self.viewForButton.checkUpdates(text: self.model.checkText(text: text!.text!))
            }
        }))
       present(alertController, animated: true)
    }
}
