//
//  TabBarController.swift
//  DiaryApp
//
//  Created by 김현석 on 2023/01/03.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBar.barTintColor = UIColor(rgb: 0xCCD5AE)
        self.tabBar.tintColor = .systemBlue
        self.tabBar.backgroundColor = .clear
        self.tabBar.isTranslucent = false
        
        
        let firstVC = UINavigationController(rootViewController: TodayViewController())
//        firstVC.tabBarItem.selectedImage = UIImage(systemName: "pencil")
        firstVC.view.backgroundColor = .white
        firstVC.tabBarItem.title = "오늘의 일기"
        firstVC.tabBarItem.image = UIImage(systemName: "pencil")
        
        let secondVC =  UINavigationController(rootViewController: DiaryListTableViewCellController())
        secondVC.view.backgroundColor = .white
        secondVC.tabBarItem.title = "일기장"
        secondVC.tabBarItem.image = UIImage(systemName: "book.closed")
        
        viewControllers = [firstVC, secondVC]
        
    }

}
