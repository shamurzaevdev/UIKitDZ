//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after ldoading the view.
        title = "FIRST VC"
//        navigationController?.navigationBar.backgroundColor = .gray
//        let backItem = UIBarButtonItem()
//        backItem.setT
        view.backgroundColor = .gray
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVcAction), for: .touchUpInside)
        view.addSubview(displaySecondButton)
    }
    
    @objc func performDisplaySecondVcAction(parameterSender: UIButton) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

