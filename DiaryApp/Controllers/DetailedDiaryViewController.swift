//
//  DetailedDiaryViewController.swift
//  DiaryApp
//
//  Created by 김현석 on 2023/01/02.
//

import UIKit

final class DetailedDiaryViewController: UIViewController {

    let detailedDiaryView = DetailedDiaryView()
    
    var selectedDiary: DailyDiary?
    
    // MARK: - loadView()
    override func loadView() {
        print("DetailedDiaryViewController - loadView")
        view = detailedDiaryView
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        print("DetailedDiaryViewController - viewDidLoad")
        super.viewDidLoad()
        setUpDiaryData()
    }
    
    
    func setUpDiaryData() {
        detailedDiaryView.selectedDiary = self.selectedDiary
    }

}
