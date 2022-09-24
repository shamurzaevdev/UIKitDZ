//
//  Alert.swift
//  UIKitDZ
//
//  Created by Эл on 24.09.2022.
//

import Foundation

struct AlertMessage {
    func checkText(text: String) -> String {
        if text == "leohl" {
            return "hello"
        }
        return "wrong text"
    }
}
