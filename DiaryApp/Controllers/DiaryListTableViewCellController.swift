//
//  ListViewController.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/09.
//

import UIKit
import SnapKit

class DiaryListTableViewCellController: UIViewController {
    
    let mainTableView = UITableView()
    let diaryListManager = DiaryListManager()
    var diaryArray: [DailyDiary?] = []
    
    var selectedDiary: DailyDiary?
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        print("DiaryListTableViewCellController : viewDidLoad")
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(rgb: 0xF7F0E7)
//        setupNaviBar()
        parseDiaryList()
        setUpTableView()
        setUpTableViewConstraints()
        mainTableView.reloadData()
        
        self.title = "일기 목록"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.diaryArray = []
        super.viewWillAppear(animated)

        parseDiaryList()
        mainTableView.reloadData()
    }
    
    func setUpTableView() {

        // 델리게이트 패턴의 대리자 설정
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        // 셀의 높이 설정
        mainTableView.rowHeight = 120
        
        // 스크롤시 키보드 내리기
        mainTableView.keyboardDismissMode = .onDrag
        
        // 셀의 등록⭐️ (타입인스턴스 - 메타타입)
        mainTableView.register(DiaryListTableViewCell.self, forCellReuseIdentifier: "DiaryListTableViewCell")
    }
    
    func parseDiaryList() {
        let allDiary = diaryListManager.parseAllDiary()
        self.diaryArray = allDiary
    }
    
    func setUpTableViewConstraints() {
        view.addSubview(mainTableView)
        mainTableView.backgroundColor = UIColor(rgb: 0xE6DFD5)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
    
    func setupNaviBar() {
        
        title = "일기 목록"
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = .red
 

      
    }
    
}

// MARK: - extension ViewController: UITableViewDataSource
extension DiaryListTableViewCellController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return diaryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryListTableViewCell", for: indexPath) as! DiaryListTableViewCell

        cell.diaryDate.text = diaryArray[indexPath.row]?.date
        cell.diaryText.text = diaryArray[indexPath.row]?.text
    
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}


// MARK: - UITableViewDelegate
extension DiaryListTableViewCellController: UITableViewDelegate {
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        // 다음화면으로 이동
        let detailVC = DetailedDiaryViewController()
        
        detailVC.selectedDiary = self.diaryArray[indexPath.row]
        
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        
        

    }
    
//     테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
