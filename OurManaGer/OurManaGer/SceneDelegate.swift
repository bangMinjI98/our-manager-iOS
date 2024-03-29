//
//  SceneDelegate.swift
//  OurManaGer
//
//  Created by 방민지 on 11/16/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: staffMainView())
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }




}

