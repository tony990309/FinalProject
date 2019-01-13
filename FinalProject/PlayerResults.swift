//
//  PlayerResults.swift
//  FinalProject
//
//  Created by User01 on 2019/1/13.
//  Copyright © 2019 chen. All rights reserved.
//

import Foundation


struct Player: Codable {
    var pic: URL
    var name: String
    var number: String
    var position: String
    var pts: String
    var fgp: String
    var tpp: String
    var ftp: String
    var reb: String
    var ast: String
    var stl: String
    var to: String
}

struct PlayerResults: Codable {
    var resultCount: Int
    var results: [Player]
}
