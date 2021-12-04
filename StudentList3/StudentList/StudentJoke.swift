//
//  StudentJoke.swift
//  StudentList
//
//  Created by Александр Савков on 4.12.21.
//

import Foundation

// MARK: - StudentJoke
struct StudentJoke: Codable {
    let error: Bool?
    let category, type, setup, delivery: String?
    let flags: Flags?
    let safe: Bool?
    let id: Int?
    let lang: String?
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool?
    let sexist, explicit: Bool?
}
