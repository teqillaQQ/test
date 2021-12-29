//
//  MemoryManagerRealm.swift
//  StudentList
//
//  Created by Александр Савков on 25.12.21.
//

import RealmSwift

class StudentRealm: Object {
    @Persisted var name: String
    @Persisted var gender: Int
    
    convenience init(name: String, gender: Int) {
        self.init()
        self.name = name
        self.gender = gender
    }
}

class StudentManagerRealm: StudentManagerProtocol {
    let realm = try! Realm()
    
    func saveData (menList: [String]?, womenList: [String]?) {
        clearData()
        saveMenList(menList)
        saveWomenList(womenList)
    }
    
    internal func saveMenList (_ menList: [String]?) {
        guard let menList = menList else {
            return
        }
        for name in menList {
            saveStudent(name: name, gender: 0)
        }
    }
    internal func saveWomenList (_ womenList: [String]?) {
        guard let womenList = womenList else {
            return
        }
        for name in womenList {
            saveStudent(name: name, gender: 1)
        }
    }
    
    private func saveStudent(name: String, gender: Int) {
        let student = StudentRealm(name: name, gender: gender)
        do {
            try realm.write {
                realm.add(student)
            }
        } catch {
            print("error saving to realm \(error)")
        }
    }
    func loadMen () -> [String] {
        readStudent(gender: 0)
    }
    
    func loadWomen () -> [String] {
        readStudent(gender: 1)
    }
    private func readStudent (gender: Int) -> [String] {
        let students = realm.objects(StudentRealm.self).where
        { $0.gender == gender }
        return students.map {$0.name}
    }
    private func clearData() {
        let students = realm.objects(StudentRealm.self)
        do {
            try realm.write {
                realm.delete(students)
            }
        } catch {
            print("error dellite realm objects \(error)")
        }
    }
}
