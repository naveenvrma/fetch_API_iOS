//
//  UserModel.swift
//  RESTful_API
//
//  Created by Naveen Varma on 2022-01-08.
//  Copyright © 2022 naveen. All rights reserved.
//

import Foundation

struct Nation: Codable {
    let data: [Datum]
}

// MARK: - Datum

struct Datum: Codable {
    let nation: String
    let year: String

    enum CodingKeys: String, CodingKey {
        case nation = "Nation"
        case year = "Year"
    }
}

