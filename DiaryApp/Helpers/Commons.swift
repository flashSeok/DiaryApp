//
//  Commons.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/11.
//

import UIKit

class Commons {
    
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter() //객체 생성
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy년 MM월 dd일" //데이터 포멧 설정
//        formatter.dateFormat = "yyyyMMdd" //데이터 포멧 설정
        let str = formatter.string(from: Date()) //문자열로 바꾸기
        
        return str

    }
    
    func getDateSeq() -> String {
        let formatter = DateFormatter() //객체 생성
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyyMMdd" //데이터 포멧 설정
        let str = formatter.string(from: Date()) //문자열로 바꾸기
        
        return str

    }
}



