//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Эл on 21.09.2022.
//

import UIKit
/// Scene Delegate

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = scene as? UIWindowScene else { return }
            
            window = UIWindow(windowScene: windowScene)
            let iReaderViewController = IReaderViewController()
            let navController = UINavigationController(rootViewController: iReaderViewController)
            window?.rootViewController = navController
            window?.backgroundColor = .gray
            window?.makeKeyAndVisible()

    }
}
