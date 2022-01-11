//
//  Mamory.swift
//  StudentList
//
//  Created by Александр Савков on 5.12.21.
//

import Foundation

class Memory: StudentManagerProtocol {
    
    let userDefaults = UserDefaults.standard
    func saveData (menList: [String]?, womenList: [String]?) {
        saveMenList(menList)
        saveWomenList(womenList)
    }
    
    internal func saveMenList (_ menList: [String]?) {
        userDefaults.set(menList, forKey: "MenList")
    }
    internal func saveWomenList (_ womenList: [String]?) {
        userDefaults.set(womenList, forKey: "WomenList")
    }
    
    func loadMen () -> [String] {
        if let menList = userDefaults.array(forKey: "MenList") as? [String] {
            return menList
        } else {
            return []
        }
    }
    
    func loadWomen () -> [String] {
        if let womenList = userDefaults.array(forKey: "WomenList") as? [String] {
            return womenList
        } else {
            return []
        }
    }
}
