//
//  CheckViewController.swift
//  UIKitDZ
//
//  Created by Эл on 28.09.2022.
//

import UIKit

/// There are an information about the order
final class CheckViewController: UIViewController {

    // MARK: - Private properties
    private lazy var checkInfoLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 50, width: 300, height: 200)
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 15)
            label.center.x = view.center.x
            label.textAlignment = .center
            label.text = "LV Sneakers Trainer"
            return label
        }()

    private lazy var priceInfoLabel: UILabel = {
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
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        title = "Check"
        view.backgroundColor = .white
        view.addSubview(checkInfoLabel)
        view.addSubview(priceInfoLabel)
    }
}
