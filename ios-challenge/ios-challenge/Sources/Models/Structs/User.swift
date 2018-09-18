//
//  User.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 16/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import Foundation

/*
{
    "name": "Angela Ursic Bedoya",
    "email": "angela.ursic@linio.com",
    "linioId": "qe54zj"
}
*/

// Model for Linio User

struct User {

    let name: String
    let email: String
    let linioId: String

    private enum CodingKeys: String, CodingKey {

        case name
        case email
        case linioId
    }

}

extension User: Decodable {

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        linioId = try values.decode(String.self, forKey: .linioId)
    }
}
