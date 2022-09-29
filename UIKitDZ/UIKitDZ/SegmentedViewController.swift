//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

/// In this class we can chose the necessary element of items in our shop
class SegmentedViewController: UIViewController {

    var segmentedControll = UISegmentedControl()
    var menuArray = ["one", "two", "three"]
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center.y = view.center.y - 150
        imageView.center.x = view.center.x
        imageView.image = images[0]
        return imageView
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6.0
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        return button
    }()
    
    var images = [UIImage(named: "lvOne"),
                      UIImage(named: "lvTwo"),
                      UIImage(named: "lvThree")]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // create segmented and setup the app
        setupUI()
    }

    func setupUI() {
    
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
        
        let checkViewController = CheckViewController()
        let actionController = UIAlertController(
                            title: "Do you want to buy it?",
                            message: "SNEAKER LV TRAINER",
                            preferredStyle: .alert
                        )
                        let cancelAction = UIAlertAction(title: "No", style: .default)
                        let billAction = UIAlertAction(title: "Yes", style: .default) { _ in
                        let navVC = UINavigationController(rootViewController: checkViewController)
                        navVC.modalPresentationStyle = .fullScreen
                        self.present(navVC, animated: true)
                        }
                        actionController.addAction(cancelAction)
                        actionController.addAction(billAction)
                        self.present(actionController, animated: true, completion: nil)
                        self.view.endEditing(true)
            }
    }
