//
//  UserDefault.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/16.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import Foundation

struct UserData {
    static let userDefault = Foundation.UserDefaults.standard
    
    struct Key {
        static let ID = "ID"
        static let token = "token"
    }
}

extension UserData {
    static var ID: Int? {
        get {
            return userDefault.integer(forKey: Key.ID)
        } set {
            userDefault.set(newValue, forKey: Key.ID)
            userDefault.synchronize()
        }
    }
    static var token: String? {
        get {
            return userDefault.string(forKey: Key.token) ?? nil
        } set {
            userDefault.set(newValue, forKey: Key.token)
            userDefault.synchronize()
        }
    }
}
