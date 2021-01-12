//
//  SceneDelegate.swift
//  ReactiveCalendarIOS
//
//  Created by Maksim Artemov on 12/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navVC = UINavigationController()
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
        appCoordinator = AppCoordinator(presenter: navVC)
        appCoordinator.start()
    }

}

class AppCoordinator {
    
    let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let calendarView = CalendarViewController.instantiate()
        calendarView.view.backgroundColor = .yellow
        presenter.setViewControllers([calendarView], animated: true)
    }
}

public extension UIViewController {
    static func instantiate() -> Self {
        let bundle = Bundle(for: Self.self)
        return Self(nibName: nil, bundle: bundle)
    }
}
