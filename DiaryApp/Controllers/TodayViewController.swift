//
//  ViewController.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/07.
//

import UIKit
import RealmSwift

final class TodayViewController: UIViewController {
   
    let todayView = TodayView()
    let commons = Commons()
    
    let writeView = WriteView()
    let writeViewController = WriteViewController()
    
    
    var text: String?
    
    override func loadView() {
        print(#function)
        view = todayView
    }
    
    
    override func viewDidLoad() {
        print("ViewController - viewDidLoad")
                
        super.viewDidLoad()
        self.title = "오늘의 일기"
        
        view.backgroundColor = UIColor(rgb: 0xFAEDCD)
        setUpAddTarget()
        writeViewController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
        setUpTodayInfomation()
    }


    func setUpAddTarget() {
        todayView.writeButton.addTarget(self, action: #selector(tappedWriteButton), for: .touchUpInside)
    }
    
    
    @objc func tappedWriteButton() {
        print(#function)
        

        navigationController?.pushViewController(writeViewController, animated: true)
    }
    

    func setupNaviBar() {
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

    }
    
    
    func setUpTodayInfomation() {
        print(#function)
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let date = commons.getCurrentDateTime()
        
        let diary = realm.objects(DailyDiary.self)
        
        let todayDiary = diary.filter("date == '\(date)'")
//        print("todayDiary : \(todayDiary)")
        
        if todayDiary.count == 0 {
            todayView.mainLabel.text = "오늘 하루를 입력해 주세요."
        } else {
            todayView.mainLabel.text = todayDiary[todayDiary.count - 1].text
            self.text = todayDiary[0].text
//            todayView.writeButton.isEnabled = false
        }
    }
}

// MARK: - extension DataSendProtocol
extension TodayViewController: DataSendProtocol {

    func dataSend(data: String) {
        if data != "" || data != nil {
            todayView.writeButton.isEnabled = false
        }

        todayView.mainLabel.text = data
    }
}
