//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit

/// Our Timer

final class TimerViewController: UIViewController {

    // MARK: - Private properties
    
    private var buttonIsSelected = false
    private var myTimer = Timer()
    private var counter = 0
    
    private lazy var secondsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 100, width: 300, height: 23)
        label.text = "Time: 0 seconds"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    private lazy var startButton: UIButton = {
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 150, y: 200, width: 100, height: 50)
        button.setTitle("Start", for: .normal)
        button.setTitle("Pause", for: .highlighted)
        button.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        var button = UIButton()
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 150, y: 250, width: 100, height: 50)
        button.setTitle("Reset", for: .normal)
        button.setTitle("Reseted", for: .highlighted)
        button.addTarget(self, action: #selector(resetTimerAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(startButton)
        view.addSubview(secondsLabel)
        view.addSubview(resetButton)
    }
    
    // MARK: - Objc Methods
    
    @objc private func selectButtonAction(sender: UIButton) {
        if buttonIsSelected == false {
            sender.setTitle("Pause", for: .normal)
            myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerAction), userInfo: nil, repeats: true)
            buttonIsSelected = true
        } else {
            sender.setTitle("Start", for: .normal)
            myTimer.invalidate()
            buttonIsSelected = false
        }
    }
    @objc private func updateTimerAction() {
        counter += 1
        secondsLabel.text = "Time: \(counter) seconds"
    }
    
    @objc private func resetTimerAction(sender: UIButton) {
        counter = 0
        secondsLabel.text = "Time: 0 seconds"
        myTimer.invalidate()
    }
}
