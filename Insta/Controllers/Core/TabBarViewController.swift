//
//  TabBarViewController.swift
//  Insta
//
//  Created by Мария Елизарова on 29.09.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Define VCs
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let activity = NotificationsViewController()
        let profile = ProfileViewController()
        
        let navHome = UINavigationController(rootViewController: home)
        let navExplore = UINavigationController(rootViewController: explore)
        let navCamera = UINavigationController(rootViewController: camera)
        let navActivity = UINavigationController(rootViewController: activity)
        let navProfile = UINavigationController(rootViewController: profile)
        
        // Define tab items
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navExplore.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 1)
        navCamera.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 1)
        navActivity.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 1)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        
        // Set controllers
        self.setViewControllers([navHome, navExplore, navCamera, navActivity, navProfile], animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
