//
//  SceneDelegate.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        addAsRoot(HomeViewController())
    }
    
    private func addAsRoot(_ controller: UIViewController) {
        let navigation = UINavigationController(rootViewController: controller)
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.primaryColor
        
        let appearance = UINavigationBar.appearance()
        appearance.standardAppearance = navBarAppearance
        appearance.compactAppearance = navBarAppearance
        appearance.scrollEdgeAppearance = navBarAppearance
        appearance.backIndicatorImage = UIImage(systemName: "arrow.backward")
        appearance.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        if #available(iOS 15.0, *) {
            appearance.compactScrollEdgeAppearance = navBarAppearance
        } else {
            // Fallback on earlier versions
        }
        window?.rootViewController = navigation
    }
    
}

extension UIColor {
    
    static let primaryColor: UIColor = UIColor(red: 0.99, green: 0.87, blue: 0.06, alpha: 1.00)
    
}
