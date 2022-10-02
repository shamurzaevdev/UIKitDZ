//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Эл on 02.10.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECOND VC"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    @objc func goBack() {
        //navigationController?.popViewController(animated: true)
        // получаем текущий массив контроллеров
        var currentControllers = navigationController?.viewControllers
        //delete last controller
        currentControllers?.removeLast()
        guard let newController = currentControllers else { return }
        navigationController?.viewControllers = newController
    }
}
