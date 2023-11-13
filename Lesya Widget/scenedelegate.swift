//
//  scenedelegate.swift
//  lesyawidget
//
//  Created by mll on 13.10.2023.
//
import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            
            // Add an observer for the "theme" key in UserDefaults
            UserDefaults.standard.addObserver(self, forKeyPath: "theme", options: [.new], context: nil)
            
            // Check the current theme in UserDefaults and set the initial user interface style
            if let themeValue = UserDefaults.standard.string(forKey: "theme"),
               let theme = Theme(rawValue: themeValue)?.uiInterfaceStyle {
                window.overrideUserInterfaceStyle = theme
            }
            
            window.rootViewController = UIHostingController(rootView: lesyalist())
            window.makeKeyAndVisible()
            
        }
    }

    // Method to observe changes in UserDefaults
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        guard
            let change = change,
            object != nil,
            keyPath == "theme",
            let themeValue = change[.newKey] as? String,
            let theme = Theme(rawValue: themeValue)?.uiInterfaceStyle
        else { return }

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: { [weak self] in
            self?.window?.overrideUserInterfaceStyle = theme
        }, completion: nil)
    }
}

