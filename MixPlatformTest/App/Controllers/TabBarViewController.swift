import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .orange
        
        let tvViewController = TVViewController()
        let tvItem = UITabBarItem(title: Constants.tv, image: UIImage(named: "tv"), selectedImage: UIImage(named: "tv"))
        tvViewController.tabBarItem = tvItem
        
        let videoViewController = VideoViewController()
        let videoItem = UITabBarItem(title: Constants.video, image: UIImage(named: "video"), selectedImage: UIImage(named: "video"))
        videoViewController.tabBarItem = videoItem
        
        let subscribesViewController = SubscribesViewController()
        let subscribesItem = UITabBarItem(title: Constants.subscribes, image: UIImage(named: "subscribes"), selectedImage: UIImage(named: "subscribes"))
        subscribesViewController.tabBarItem = subscribesItem
        
        let favoritesViewController = FavoritesViewController()
        let favoritesItem = UITabBarItem(title: Constants.favorites, image: UIImage(named: "favorites"), selectedImage: UIImage(named: "favorites"))
        favoritesViewController.tabBarItem = favoritesItem
        
        let settingsViewController = SettingsViewController()
        let settingsItem = UITabBarItem(title: Constants.settings, image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        settingsViewController.tabBarItem = settingsItem
        
        self.viewControllers = [tvViewController,
                                videoViewController,
                                subscribesViewController,
                                favoritesViewController,
                                settingsViewController]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.tintColor = .white
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        searchButton.tintColor = .orange
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selectedIndex = 1
    }
}
