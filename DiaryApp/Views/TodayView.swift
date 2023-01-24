//
//  TodayView.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/09.
//

import UIKit

final class TodayView: UIView {

//    let subLabel: UILabel = {
//        let label = UILabel()
//        label.text = "오늘 하루를 입력해 보세요"
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 24, weight: .semibold)
//        label.textColor = .black
//
//        return label
//    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "뭐했지"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    let writeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("일기 쓰기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(rgb: 0xD4A373)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    

    
    // MARK: - override init(frame: CGRect)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAddSubViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setAddSubViews()
    func setAddSubViews() {
        print(#function)
        
//        self.addSubview(subLabel)
        self.addSubview(mainLabel)
        self.addSubview(writeButton)
    }
    
    // MARK: - setUpConstraints()
    func setUpConstraints() {
//        setSubLabelConstraints()
        setMainLabelConstraints()
        setWriteButtonConstraints()
    }
    
    // MARK: - subLabelConstraints()
//    func setSubLabelConstraints() {
//        print(#function)
//        subLabel.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
//            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(40)
//            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-40)
//        }
//    }
    
    func setMainLabelConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
    }
    
    func setWriteButtonConstraints() {
        writeButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(UIScreen.main.bounds.size.width / 3)
            make.height.equalTo(40)
        }
    }

}
