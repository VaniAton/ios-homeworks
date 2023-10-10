import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)

        let newsViewController = UINavigationController(rootViewController: FeedViewController())

        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        
        let tabBarController = UITabBarController()


        newsViewController.tabBarItem = UITabBarItem(title: "Лента Новостей", image: UIImage(named: "events"), tag: 0)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "avatar"), tag: 1)


        let controllers = [newsViewController, profileViewController]
        tabBarController.viewControllers = controllers

        tabBarController.selectedIndex = 0

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()

        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

