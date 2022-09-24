//
//  View.swift
//  UIKitDZ
//
//  Created by Эл on 24.09.2022.
//

import Foundation
import UIKit

class View: UIView {
    let startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 70, height: 50)
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = .orange
        button.setTitle("Начали", for: .highlighted)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
     let resultLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 70, height: 30)
        label.textColor = .black
        return label
    }()
    func showViews() {
        self.addSubview(startButton)
        self.addSubview(resultLabel)
    }
    func checkUpdates(text: String) {
        resultLabel.text = text
    }
}
