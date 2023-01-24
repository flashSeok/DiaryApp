//
//  WriteViewController.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/09.
//

import UIKit
import RealmSwift

final class WriteViewController: UIViewController {
    
    private let writeView = WriteView()
    
    private let todayView = TodayView()
    private let diaryListManager = DiaryListManager()
    
    var delegate: DataSendProtocol?
    
    let commons = Commons()
    
    override func loadView() { view = writeView }
    
    override func viewDidLoad() {
        print("WriteViewController - viewDidLoad")
        super.viewDidLoad()
        
        setUpAddTarget()
        setTextView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.writeView.textView.becomeFirstResponder()
        setTextView()
    }
    
    
    func setTextView() {
        
        //textview에 delegate 상속
        writeView.textView.delegate = self
        
        //처음 화면이 로드되었을 때 플레이스 홀더처럼 보이게끔 만들어주기
        writeView.textView.text = "오늘 하루를 입력해 주세요."
        writeView.textView.textColor = UIColor.lightGray
        
        
        //텍스트뷰가 구분되게끔 테두리를 주도록 하겠습니다.
        writeView.textView.layer.borderWidth = 1
        writeView.textView.layer.borderColor = UIColor.black.cgColor
    }
    
    
    func setUpAddTarget() {
        writeView.enrollButton.addTarget(self, action: #selector(tappedEnrollButton), for: .touchUpInside)
    }
    
    @objc func tappedEnrollButton() {
        print(#function)
        
//        print("내용 : \(writeView.textView.text!)")
        
        let date = commons.getCurrentDateTime()
        let dateSeq = commons.getDateSeq()
        
        if writeView.textView.text == "오늘 하루를 입력해 주세요." || writeView.textView.text == "" || writeView.textView.text == nil {
            
            let alert = UIAlertController(title: "알림", message: "내용을 입력해 주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                print("내용없다")
            })
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        guard let text = writeView.textView.text else { return }
        
        let data = DailyDiary(date: date, dateSeq: dateSeq, text: text)
        
        let result = diaryListManager.addDiary(data: data)
        
        if true == result {
            self.navigationController?.popViewController(animated: true)
            diaryListManager.parseTodayDiary()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.writeView.textView.resignFirstResponder()
    }
    
}

// MARK: - UITextViewDelegate 채택
extension WriteViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if writeView.textView.text.isEmpty {
            writeView.textView.text =  "오늘 하루를 입력해 주세요."
            writeView.textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if writeView.textView.textColor == UIColor.lightGray {
            writeView.textView.text = nil
            writeView.textView.textColor = UIColor.black
        }
    }
}

protocol DataSendProtocol {
    func dataSend(data: String)
}
