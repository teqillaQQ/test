//
//  Mamory.swift
//  StudentList
//
//  Created by Александр Савков on 5.12.21.
//

import Foundation

class Memory {
    
    let userDefaults = UserDefaults.standard
    
    func saveData (menList: [String]?, womenList: [String]?) {
        saveMenList(menList)
        saveWomenList(womenList)
    }
    
    private func saveMenList (_ menList: [String]?) {
        userDefaults.set(menList, forKey: "MenList")
    }
    private func saveWomenList (_ womenList: [String]?) {
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
