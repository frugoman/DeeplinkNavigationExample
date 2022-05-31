//
//  SceneDelegate.swift
//  NativeNavigationPoC
//
//  Created by Nicolas Frugoni on 31/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = RootViewControllerFactory().makeRootViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
class RootViewControllerFactory {
    let registry: ViewControllerRegistry
    let resolver: ViewControllerResolver
    
    init() {
        registry = InMemoryViewControllerRegistry()
        resolver = RegistryViewControllerResolver(registry: registry)
    }
    
    func makeRootViewController() -> UIViewController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [
            makeFlightsTabViewController(),
            makeProfileTabViewController()
        ]
        return tabBar
    }
    
    private func register(withNavigator navigator: ScreenNavigator) {
        ViewControllerRegistratorComposer(
            registry: registry,
            navigator: navigator,
            resolver: resolver
        ).register()
    }
    
    private func makeNavigationController(withViewControllers viewControllers: @autoclosure () -> [UIViewController]) -> UINavigationController {
        let navController = UINavigationController(rootViewController: UIViewController())
        let navigator = UINavigationControllerScreenNavigator(navigationController: navController)
        register(withNavigator: navigator)
        navController.viewControllers = viewControllers()
        return navController
    }
    
    private func makeFlightsTabViewController() -> UIViewController {
        let flightsNav = makeNavigationController(withViewControllers: [
            try! resolver.resolve(forKey: "FlightsList")
        ])
        flightsNav.tabBarItem = UITabBarItem(title: "Flights", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName: "paperplane.fill"))
        return flightsNav
    }
    
    private func makeProfileTabViewController() -> UIViewController {
        let profileNav = makeNavigationController(withViewControllers: [
            try! resolver.resolve(forKey: "Profile")
        ])
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        return profileNav
    }
}
