//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Эл on 03.10.2022.
//

import UIKit

/// List of pizzas
final class PizzaViewController: UIViewController {

    // MARK: - Private Properties
    private let pizzaMarheritaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "margarita")
        imageView.frame = CGRect(x: 25, y: 150, width: 140, height: 140)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let pizzaMushroomsImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "mushroom")
        imageView.frame = CGRect(x: 25, y: 350, width: 140, height: 140)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let pizzaMargheritaLabel: UILabel = {
        var label = UILabel()
        label.text = "Margherita"
        label.textColor = .systemRed
        label.font = .boldSystemFont(ofSize: 22)
        label.frame = CGRect(x: 170, y: 180, width: 150, height: 50)
        return label
    }()

    private let pizzaMushroomsLabel: UILabel = {
        var label = UILabel()
        label.text = "Mushrooms"
        label.textColor = .systemRed
        label.font = .boldSystemFont(ofSize: 22)
        label.frame = CGRect(x: 170, y: 390, width: 180, height: 50)
        return label
    }()

    private lazy var addMarheritaIngridientsButton: UIButton = {
        var button = UIButton()
        button.tag = 0
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemRed
        button.frame = CGRect(x: 310, y: 185, width: 40, height: 40)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addIngridientsButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var addMushroomIngridientsButton: UIButton = {
        var button = UIButton()
        button.tag = 1
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemRed
        button.frame = CGRect(x: 310, y: 395, width: 40, height: 40)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addIngridientsButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }

    // MARK: - Public Methods
    func addSubviewElements() {
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.topItem?.title = ""
        title = "Pizza"
        view.addSubview(pizzaMarheritaImage)
        view.addSubview(pizzaMushroomsImage)
        view.addSubview(pizzaMargheritaLabel)
        view.addSubview(pizzaMushroomsLabel)
        view.addSubview(addMarheritaIngridientsButton)
        view.addSubview(addMushroomIngridientsButton)
    }

    // MARK: - @Objc private Action
    @objc private func addIngridientsButtonAction(_ sender: UIButton) {
        let ingridientsVC = IngridientsViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        switch sender.tag {
        case 0:
            ingridientsVC.pizzaNameLabel.text = pizzaMargheritaLabel.text
            ingridientsVC.pizzaImage.image = UIImage(named: "margarita")
        case 1:
            ingridientsVC.pizzaNameLabel.text = pizzaMushroomsLabel.text
            ingridientsVC.pizzaImage.image = UIImage(named: "mushroom")
        default:
            break
        }
        present(ingridientsVC, animated: false)
    }
}
