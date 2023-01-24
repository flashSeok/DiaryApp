//
//  Diary.swift
//  MemoApp
//
//  Created by 김현석 on 2022/11/11.
//

import UIKit
import Realm
import RealmSwift

class DailyDiary: Object {
    @Persisted(primaryKey: true) var _id: ObjectId // primary key로 지정
    @Persisted var date: String = ""
    @Persisted var dateSeq: String = ""
    @Persisted var text: String = ""

    convenience init(date: String, dateSeq: String, text: String) {
        self.init()
        self.date = date
        self.dateSeq = dateSeq
        self.text = text
    }
}
