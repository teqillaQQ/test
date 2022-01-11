//
//  StudentManager.swift
//  StudentList
//
//  Created by Александр Савков on 25.12.21.
//

import Foundation

class TypeOfSaveAndReadData {
    
    var memory = Memory()
    var memoryCoreData = MemoryCoreData()
    var studentManagerRealm = StudentManagerRealm()
}

protocol StudentManagerProtocol {
    
    func saveData (menList: [String]?, womenList: [String]?)
    func saveMenList (_ menList: [String]?)
    func saveWomenList (_ womenList: [String]?)
    func loadMen () -> [String]
    func loadWomen () -> [String]
}
