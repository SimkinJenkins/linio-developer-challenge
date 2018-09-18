//
//  ProductsCollection.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 16/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import Foundation

/*
{
 "id": 408483,
 "name": "Mi lista de favoritos",
 "description": "Mi lista de favoritos",
 "default": false,
 "owner": {
 "name": "Doctor Evil",
 "email": "customer-53284@linio.com",
 "linioId": "52xcfee"
 },
 "createdAt": "2016-06-10T23:04:23+0000",
 "visibility": "public",
 "products": {}
}
*/

struct ProductsCollection {

    let id: Int
    let name: String
    let description: String
    let linioDefault: Bool
    let owner: User
    let createdAt: String
    let visibility: String
    let products: [String: Product]

    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case description
        case linioDefault = "default"
        case owner
        case createdAt
        case visibility
        case products
    }

}

extension ProductsCollection: Decodable {

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        linioDefault = try values.decode(Bool.self, forKey: .linioDefault)
        owner = try values.decode(User.self, forKey: .owner)
        createdAt = try values.decode(String.self, forKey: .createdAt)
        visibility = try values.decode(String.self, forKey: .visibility)
        products = try values.decode([String: Product].self, forKey: .products)
    }
}
