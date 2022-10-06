//
//  TrainViewController.swift
//  UIKitDZ
//
//  Created by Эл on 05.10.2022.
//

import UIKit

/// This clas is just for trayning

final class TrainViewController: UIViewController {

    // MARK: - Private properties
        private var segmentedControll = UISegmentedControl()
        private var menuArray = ["one", "two", "three"]

        private lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            imageView.center.y = view.center.y - 150
            imageView.center.x = view.center.x
            imageView.image = images[0]
            return imageView
        }()

        private let buyButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
            button.setTitle("Buy", for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = 6.0
            button.setTitleColor(.white, for: .normal)
            button.setTitleColor(.black, for: .highlighted)
            return button
        }()

        private var images = [UIImage(named: "lvOne"),
                          UIImage(named: "lvTwo"),
                          UIImage(named: "lvThree")]

        override func viewDidLoad() {
            super.viewDidLoad()

            setupUI()
        }

        // MARK: - Private methods
        private func setupUI() {

            segmentedControll = UISegmentedControl(items: menuArray)
            segmentedControll.frame = CGRect(x: 100, y: 450, width: 200, height: 30)
            view.addSubview(segmentedControll)
            view.addSubview(imageView)
            segmentedControll.addTarget(self, action: #selector(selectVlaueAction), for: .valueChanged)
            view.backgroundColor = .white
            view.addSubview(buyButton)
            buyButton.addTarget(self, action: #selector(buyAction), for: .touchUpInside)
        }

        @objc private func selectVlaueAction(target: UISegmentedControl) {
            if target == segmentedControll {
                let segmentIndex = target.selectedSegmentIndex
                imageView.image = images[segmentIndex]
            }
        }

        @objc private func buyAction(sender: UIButton) {
        }
}
