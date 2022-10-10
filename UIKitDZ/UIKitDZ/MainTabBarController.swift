//
//  MainTabBarController.swift
//  UIKitDZ
//
//  Created by Эл on 10.10.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Constants
    private enum Constants {
        static let demoAppTabBarText = "DemoApp"
        static let secondViewTabBarText = "Second VC"
    }

    // MARK: - Private properties
    private let demoAppViewController = DemoAppViewController()
    private let demoAppTabBarItem = UITabBarItem(title: Constants.demoAppTabBarText,
                                                 image: UIImage(systemName: "bell"),
                                                 tag: 0)

    private let secondViewController = SecondViewController()
    private let seconddTabBarItem = UITabBarItem(title: Constants.secondViewTabBarText,
                                                 image: UIImage(systemName: "bell.slash.circle"),
                                                 tag: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        let navigationController = UINavigationController(rootViewController: demoAppViewController)
        viewControllers = [navigationController, secondViewController]
        demoAppViewController.tabBarItem = demoAppTabBarItem
        secondViewController.tabBarItem = seconddTabBarItem
        tabBar.backgroundColor = .systemGray6
    }
}
