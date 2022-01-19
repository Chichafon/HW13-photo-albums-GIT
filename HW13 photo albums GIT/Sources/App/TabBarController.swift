//
//  TabBarController.swift
//  HW13 photo albums GIT
//
//  Created by 111 on 19.01.2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.backgroundColor = .white

        let mediaViewController = MediaViewController()
        let mediaNavigationController = UINavigationController(rootViewController: mediaViewController)

        let forYouViewController = ForYouViewController()
        let forYouNavigationController = UINavigationController(rootViewController: forYouViewController)

        let albumsViewController = AlbumsViewController()
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)

        let searchViewController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)

        mediaViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                      image: UIImage(systemName: "photo.on.rectangle"),
                                                      tag: 0)
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                       image: UIImage(systemName: "heart.text.square"),
                                                       tag: 1)
        albumsViewController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                      image: UIImage(systemName: "folder"),
                                                      tag: 2)
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                       image: UIImage(systemName: "magnifyingglass"),
                                                       tag: 3)

        viewControllers = [mediaNavigationController, forYouNavigationController, albumsNavigationController, searchNavigationController]
    }
}
