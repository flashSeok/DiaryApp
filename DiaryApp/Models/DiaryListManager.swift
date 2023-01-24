//
//  DiaryListManager.swift
//  MemoApp
//
//  Created by 김현석 on 2022/12/06.
//

import UIKit
import RealmSwift


class DiaryListManager {
    
    private var diaryList: [DailyDiary] = []
    
    func addDiary(data: DailyDiary) -> Bool {
        let realm = try? Realm()
        
        do {
            try realm?.write() {
                realm?.add(data)
                
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                
                return true
            }
        } catch {
            print(error.localizedDescription)
            
            return false
        }
        
        print("여기")
        return true
        
    }
    
    func parseTodayDiary() -> [DailyDiary?] {
        print(#function)
        
        let realm = try! Realm()
        let commons = Commons()
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let date = commons.getCurrentDateTime()
        
        print("날짜 : \(date)")
        
        let diary = realm.objects(DailyDiary.self)
        
        //        let filteredDiary = diary.filter("date == '\(date)'")
        
        
        diary.forEach { data in
            diaryList.append(data)
            
//            print("dddddddd")
//            print("diaryList: \(diaryList)")
        }
        
        return diaryList.reversed()
    }
    
    func parseAllDiary() -> [DailyDiary?] {
        let realm = try! Realm()
        
        print("불러오는 파일 위치 : \(Realm.Configuration.defaultConfiguration.fileURL!)")
        
        let diary = realm.objects(DailyDiary.self)
        
        self.diaryList = []
        
        diary.forEach { data in
            diaryList.append(data)
        }
        
        return diaryList.reversed()
    }
}
