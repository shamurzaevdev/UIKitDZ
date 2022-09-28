//
//  CheckViewController.swift
//  UIKitDZ
//
//  Created by Эл on 28.09.2022.
//

import UIKit

/// Check View Controller: There are an information about the order
class CheckViewController: UIViewController {
    
    lazy var checkInfoLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 50, width: 300, height: 200)
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 15)
            label.center.x = view.center.x
            label.textAlignment = .center
            label.text = "LV Sneakers Trainer"
            return label
        }()
    
    lazy var priceInfoLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 80, width: 300, height: 200)
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 15)
            label.center.x = view.center.x
            label.textAlignment = .center
            label.text = "Price: 1000 Euro"
            return label
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Check"
        view.backgroundColor = .white
        view.addSubview(checkInfoLabel)
        view.addSubview(priceInfoLabel)
    }
}
