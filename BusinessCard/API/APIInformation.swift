//
//  APIInformation.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/16.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import Foundation

struct User: Codable {
  let token: String
}

struct nameAPICodable: Codable {

    let nickname: String
    let token: String
    let user_id: Int
    let Qiita: String
    let skills: String
    let otherURL: String
    let affiliation1: String
    let affiliation2: String
    let Github: String
    let name: String
}

