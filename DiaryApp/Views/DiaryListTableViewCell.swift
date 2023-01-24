//
//  DiaryListTableViewCell.swift
//  MemoApp
//
//  Created by 김현석 on 2022/12/13.
//

import UIKit
import SnapKit

final class DiaryListTableViewCell: UITableViewCell {

    var diaryList: [DailyDiary]? = nil
    
    let diaryDate: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray

        return label
    }()
    
    let diaryText: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 16)

        return label
    }()
    
    lazy var stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 6

        return sv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setAddSubView()
        setConstraints()
        
    }

    func setAddSubView() {
        self.addSubview(diaryDate)
        self.addSubview(diaryText)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 오토레이아웃 정하는 정확한 시점
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
        
    }
    
    // MARK: - Constraints 설정
    func setConstraints() {
        setProductNameKrLabelConstraints()
        setProductNameEnLabelConstraints()
    }

    
    func setProductNameKrLabelConstraints() {
        diaryDate.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(15)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
    }
                                           
    func setProductNameEnLabelConstraints() {
        diaryText.snp.makeConstraints { make in
            make.top.equalTo(diaryDate.snp.bottom).offset(6)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(20)
            make.right.equalTo(self.snp.right).offset(-20)
        }
       
    }
}
