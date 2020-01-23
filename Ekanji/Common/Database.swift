//
//  Database.swift
//  Ekanji
//
//  Created by Hiromu Nakano on 2020/01/23.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import RealmSwift

struct Database {

    func save(original: String, converted: String) {
        do {
            let realm = try Realm()
            try realm.write {
                let history = HistoryData(original: original, converted: converted)
                realm.add(history)
            }
        } catch {
            print(error)
        }
    }

    func fetch() -> [HistoryData] {
        var histories: [HistoryData] = []
        do {
            let realm = try Realm()
            histories = realm.objects(HistoryData.self).reversed()
        } catch {
            print(error)
        }
        return histories
    }

}

class HistoryData: Object {
    @objc dynamic let date = Date()
    @objc dynamic var original: String!
    @objc dynamic var converted: String!

    convenience init(original: String, converted: String) {
        self.init()
        self.original = original
        self.converted = converted
    }
}
