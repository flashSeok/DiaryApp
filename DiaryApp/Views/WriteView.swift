//
//  WriteView.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/09.
//

import UIKit
import SnapKit

final class WriteView: UIView {

    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = UIColor(rgb: 0xFEF9EF)
        view.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        
        return view
        
    }()
    
    let enrollButton: UIButton = {
        let button = UIButton(type: .system)
     
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(rgb: 0xD4A373)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    
    // MARK: - override init(frame: CGRect)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(rgb: 0xE6DFD5)
        setAddSubViews()
        setUpConstraints()
     

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setAddSubViews()
    func setAddSubViews() {
        self.addSubview(textView)
        self.addSubview(enrollButton)
        
    }
    
    // MARK: - setUpConstraints()
    func setUpConstraints() {
        setTextViewConstraints()
        setEnrollButtonConstraints()
    }
    
    func setTextViewConstraints() {
        textView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.height.equalTo(safeAreaLayoutGuide).dividedBy(5)

        }
    }
    
    func setEnrollButtonConstraints() {
        enrollButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(20)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(UIScreen.main.bounds.size.width / 3)
            make.height.equalTo(40)
        }
    }
    
}



