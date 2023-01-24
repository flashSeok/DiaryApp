//
//  DetailedDiaryView.swift
//  DiaryApp
//
//  Created by 김현석 on 2023/01/02.
//

import UIKit
import SnapKit

final class DetailedDiaryView: UIView {

    var selectedDiary: DailyDiary? {
        didSet {
            guard var diary = selectedDiary else {
                mainLabel.text = ""
                
                return
            }
            mainLabel.text = selectedDiary?.text
        }
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    
    func setAddSubViews() {
        self.addSubview(mainLabel)
    }
    
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
    
    func setUpConstraints() {
        setMainLabelConstraints()
    }
    
    func setMainLabelConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
    }
}
