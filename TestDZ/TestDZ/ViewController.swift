//
//  ViewController.swift
//  TestDZ
//
//  Created by Эл on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.center = view.center
         
        view.addSubview(picker)
    }


}

