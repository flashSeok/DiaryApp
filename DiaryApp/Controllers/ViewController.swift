//
//  ViewController.swift
//  DiaryApp
//
//  Created by 김현석 on 2023/01/02.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let HEIGHT_TAB_BAR:CGFloat = 110
    
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        self.delegate = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let todayViewController = TodayViewController()
        let diaryListController = DiaryListTableViewCellController()
        
        //각 tab bar의 viewcontroller 타이틀 설정
        todayViewController.tabBarItem.image = UIImage.init(systemName: "pencil")
        diaryListController.tabBarItem.image = UIImage.init(systemName: "book.closed")
        
        let navigationHome = UINavigationController(rootViewController: todayViewController)
        let navigationSearch = UINavigationController(rootViewController: diaryListController)

        setViewControllers([navigationHome, navigationSearch], animated: false)
        tabBar.backgroundColor = .lightGray
    }
    

}

