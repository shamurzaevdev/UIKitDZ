//
//  IngridientsSushiViewController.swift
//  UIKitDZ
//
//  Created by Эл on 03.10.2022.
//

import UIKit

/// Our display with ingridients for sushi
final class IngridientsSushiViewController: UIViewController {

    // MARK: - Public properties
    let pizzaImage: UIImageView = {
        var image = UIImageView(frame: CGRect(
            x: 0, y: 120, width: 300, height: 300))
        return image
    }()

    let pizzaNameLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 0, y: 40, width: 200, height: 50))
         label.font = .boldSystemFont(ofSize: 30)
        return label
    }()

    // MARK: - Private Properties
    private let chesseLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 470, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Saumon"
        label.textColor = .black
        return label
    }()

    private let chesseSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 470, width: 50, height: 40))
        setSwitch.isOn = false
        return setSwitch
    }()

    private let hamLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 530, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Chiken"
        label.textColor = .black
        return label
    }()

    private let humSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 530, width: 50, height: 40))
        setSwitch.isOn = true
        return setSwitch
    }()

    private let mushroomsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 590, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Sweet Soy souce"
        label.textColor = .black
        return label
    }()

    private let mushroomsSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 590, width: 50, height: 40))
        setSwitch.isOn = false
        return setSwitch
    }()

    private let maslinsLabel: UILabel = {
        var label = UILabel(frame: CGRect(
            x: 40, y: 650, width: 250, height: 30))
        label.font = .boldSystemFont(ofSize: 19)
        label.text = "Wasabi"
        label.textColor = .black
        return label
    }()

    private let maslinsSwitch: UISwitch = {
        var setSwitch = UISwitch(frame: CGRect(
            x: 350, y: 650, width: 50, height: 40))
        return setSwitch
    }()

    private lazy var orderButton: UIButton = {
        var button = UIButton(frame: CGRect(
            x: 0, y: 700, width: 270, height: 50))
        button.setTitle("Get this food!", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(orderButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewElements()
    }

    // MARK: - Public Methods
    func addSubviewElements() {
        view.backgroundColor = .white
        pizzaImage.center.x = view.center.x
        pizzaNameLabel.center.x = view.center.x
        orderButton.center.x = view.center.x
        view.addSubview(pizzaImage)
        view.addSubview(pizzaNameLabel)
        view.addSubview(chesseLabel)
        view.addSubview(hamLabel)
        view.addSubview(mushroomsLabel)
        view.addSubview(maslinsLabel)
        view.addSubview(orderButton)
        view.addSubview(chesseSwitch)
        view.addSubview(humSwitch)
        view.addSubview(mushroomsSwitch)
        view.addSubview(maslinsSwitch)
    }

    // MARK: - @Objc private Action
    @objc private func orderButtonAction() {
        let payViewController = PayViewController()
        payViewController.delegate = self
        let navigationVC = UINavigationController(rootViewController: payViewController)
        payViewController.pizzaNameLabel.text = pizzaNameLabel.text

        if chesseSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(chesseLabel.text ?? "Saumon") "
        }

        if humSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(hamLabel.text ?? "Chiken") "
        }

        if mushroomsSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(mushroomsLabel.text ?? "Sweet Soy Souce") "
        }

        if maslinsSwitch.isOn {
            payViewController.chesseIngridientLabel.text? += "+\(maslinsLabel.text ?? "Wasabi") "
        }

        payViewController.pizzaSelectedImage.image = pizzaImage.image
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: false)
    }
}

// MARK: - Extension
extension  IngridientsSushiViewController: PopToRootDelegate {
    func goToBack() {
        if let viewController = self.presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            viewController.popToRootViewController(animated: false)
        }
    }
}
