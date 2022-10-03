//
//  MenuViewController.swift
//  UIKitDZ
//
//  Created by Эл on 03.10.2022.
//

import UIKit

/// Menu of the food where we can choose pizzas or sushis
final class MenuViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var pizzaButton: UIButton = {
        var button = UIButton()
        button.setTitle("Pizza", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.frame = CGRect(x: 40, y: 150, width: 350, height: 100)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(pizzaButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var sushiButton: UIButton = {
        var sushiButton = UIButton()
        sushiButton.setTitle("Sushi", for: .normal)
        sushiButton.setTitleColor(.black, for: .normal)
        sushiButton.layer.borderWidth = 1
        sushiButton.layer.borderColor = UIColor.black.cgColor
        sushiButton.frame = CGRect(x: 40, y: 300, width: 350, height: 100)
        sushiButton.layer.cornerRadius = 5
        sushiButton.clipsToBounds = true
        sushiButton.backgroundColor = .systemRed
        sushiButton.addTarget(self, action: #selector(sushiButtonAction), for: .touchUpInside)
        return sushiButton
    }()

    // MARK: - Public Properties
    let pizzaPhoto: UIImageView = {
        var pizzaLogo = UIImageView(frame: CGRect(
            x: 10,
            y: 0,
            width: 120,
            height: 113))
        pizzaLogo.image = UIImage(named: "pizza")
        return pizzaLogo
    }()

    let sushiPhoto: UIImageView = {
        var sushiLogo = UIImageView(frame: CGRect(
            x: 10,
            y: 5,
            width: 105,
            height: 90))
        sushiLogo.image = UIImage(named: "sushi")
        return sushiLogo
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }

    // MARK: - Public Methods
    func addSubviewElements() {
        title = "Food"
        view.addSubview(pizzaButton)
        pizzaButton.addSubview(pizzaPhoto)
        view.addSubview(sushiButton)
        sushiButton.addSubview(sushiPhoto)
    }

    // MARK: - @Objc private Action
    @objc private func pizzaButtonAction() {
        let pizzaVC = PizzaViewController()
        navigationController?.pushViewController(pizzaVC, animated: false)
    }

    @objc private func sushiButtonAction() {
        let sushiVC = SushiViewController()
        navigationController?.pushViewController(sushiVC, animated: false)
    }
}
