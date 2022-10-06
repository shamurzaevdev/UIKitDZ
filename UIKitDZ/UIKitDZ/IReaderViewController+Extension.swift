//
//  Extension+IReaderViewController.swift
//  UIKitDZ
//
//  Created by Эл on 05.10.2022.
//

import UIKit

/// Making better visability of the Class with this extension

// MARK: - Methods
extension IReaderViewController {
    
    func increaseThickness() {
        allData.increaseThicknessFontButton.frame = CGRect(x: 300, y: 670, width: 50, height: 50)
        allData.increaseThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        allData.increaseThicknessFontButton.setTitle(Constants.increaseThicknessFont, for: .normal)
        allData.increaseThicknessFontButton.addTarget(self, action: #selector(increaseThicknessFontAction), for: .touchUpInside)
        view.addSubview(allData.increaseThicknessFontButton)
    }
    
    func reduceThickness() {
    allData.reduceThicknessFontButton.frame = CGRect(x: 300, y: 720, width: 50, height: 50)
    allData.reduceThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
    allData.reduceThicknessFontButton.setTitle(Constants.reduceThicknessFont, for: .normal)
    allData.reduceThicknessFontButton.addTarget(self, action: #selector(reduceThicknessFontAction), for: .touchUpInside)
    view.addSubview(allData.reduceThicknessFontButton)
    }
    
    func changeTextColorWithBlack() {
    allData.textColorBlackButton.frame = CGRect(x: 50, y: 600, width: 40, height: 40)
    allData.textColorBlackButton.backgroundColor = .black
    allData.textColorBlackButton.layer.borderWidth = 1
    allData.textColorBlackButton.layer.borderColor = UIColor.gray.cgColor
    allData.textColorBlackButton.layer.cornerRadius = allData.textColorBlackButton.frame.size.height / 2
    allData.textColorBlackButton.addTarget(self, action: #selector(textColorBlackAction), for: .touchUpInside)
    view.addSubview(allData.textColorBlackButton)
    }
    
    func changeTextColorWithWhite() {
    allData.textColorWhiteButton.frame = CGRect(x: 100, y: 600, width: 40, height: 40)
    allData.textColorWhiteButton.backgroundColor = .white
    allData.textColorWhiteButton.layer.borderWidth = 1
    allData.textColorWhiteButton.layer.borderColor = UIColor.gray.cgColor
    allData.textColorWhiteButton.layer.cornerRadius = allData.textColorWhiteButton.frame.size.height / 2
    allData.textColorWhiteButton.addTarget(self, action: #selector(textColorWhiteAction), for: .touchUpInside)
    view.addSubview(allData.textColorWhiteButton)
    }
    
    func changeTextColorToOrange() {
    allData.textColorOrangeButton.frame = CGRect(x: 150, y: 600, width: 40, height: 40)
    allData.textColorOrangeButton.backgroundColor = .orange
    allData.textColorOrangeButton.layer.borderWidth = 1
    allData.textColorOrangeButton.layer.borderColor = UIColor.gray.cgColor
    allData.textColorOrangeButton.layer.cornerRadius = allData.textColorOrangeButton.frame.size.height / 2
    allData.textColorOrangeButton.addTarget(self, action: #selector(textColorOrangeAction), for: .touchUpInside)
    view.addSubview(allData.textColorOrangeButton)
    }
    
    func changeTextColorToBlue() {
    allData.textColorBlueButton.frame = CGRect(x: 200, y: 600, width: 40, height: 40)
    allData.textColorBlueButton.backgroundColor = .blue
    allData.textColorBlueButton.layer.borderWidth = 1
    allData.textColorBlueButton.layer.borderColor = UIColor.gray.cgColor
    allData.textColorBlueButton.layer.cornerRadius = allData.textColorBlueButton.frame.size.height / 2
    allData.textColorBlueButton.addTarget(self, action: #selector(textColorBlueAction), for: .touchUpInside)
    view.addSubview(allData.textColorBlueButton)
    }
    func shareData() {
    allData.shareButton.frame = CGRect(x: 280, y: 760, width: 100, height: 50)
    allData.shareButton.setTitle("Share", for: .normal)
    allData.shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
    view.addSubview(allData.shareButton)
    }
}
