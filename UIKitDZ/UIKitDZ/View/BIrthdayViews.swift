//
//  BIrthdayViews.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import UIKit

class BIrthdayViews: UIView {

    let jeremyLabel: UILabel = {
            let label = UILabel()
            label.text = "Jeremy"
            label.font = .boldSystemFont(ofSize: 17)
            label.frame = CGRect(x: 70, y: 120, width: 100, height: 30)
            return label
        }()

        let jeremyButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
            button.tintColor = .systemGray
            button.frame = CGRect(x: 5, y: 120, width: 60, height: 60)
            return button
        }()

        let jeremyInfo: UILabel = {
            let label = UILabel()
            label.text = "10 марта, в среду исполнится 25 лет"
            label.textColor = .systemGray
            label.frame = CGRect(x: 70, y: 150, width: 400, height: 30)
            return label
        }()

        let jeremyBrthd: UILabel = {
            let label = UILabel()
            label.text = "18 дней"
            label.textColor = .systemGray
            label.frame = CGRect(x: 300, y: 120, width: 100, height: 30)
            return label
        }()

        let mariaLabel: UILabel = {
            let label = UILabel()
            label.text = "Maria Lui"
            label.font = .boldSystemFont(ofSize: 17)
            label.frame = CGRect(x: 70, y: 220, width: 100, height: 30)
            return label
        }()

        let mariaButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
            button.tintColor = .systemGray
            button.frame = CGRect(x: 5, y: 220, width: 60, height: 60)
            return button
        }()

        let mariaInfo: UILabel = {
            let label = UILabel()
            label.text = "30 марта, в четверг исполнится 20 лет"
            label.textColor = .systemGray
            label.frame = CGRect(x: 70, y: 250, width: 400, height: 30)
            return label
        }()

        let mariaBrthd: UILabel = {
            let label = UILabel()
            label.text = "28 дней"
            label.textColor = .systemGray
            label.frame = CGRect(x: 300, y: 220, width: 100, height: 30)
            return label
        }()

        let jonyLabel: UILabel = {
            let label = UILabel()
            label.text = "Jony Stark"
            label.font = .boldSystemFont(ofSize: 17)
            label.frame = CGRect(x: 70, y: 320, width: 100, height: 30)
            return label
        }()

    let jonyButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
            button.tintColor = .systemGray
            button.frame = CGRect(x: 5, y: 320, width: 60, height: 60)
            return button
        }()

        let jonyInfo: UILabel = {
            let label = UILabel()
            label.text = "30 февраля, в четверг после дождя исполнится 20 лет"
            label.textColor = .systemGray
            label.frame = CGRect(x: 70, y: 350, width: 400, height: 30)
            return label
        }()

        let jonyBrthd: UILabel = {
            let label = UILabel()
            label.text = "53 дней"
            label.textColor = .systemGray
            label.frame = CGRect(x: 300, y: 320, width: 100, height: 30)
            return label
        }()

}
