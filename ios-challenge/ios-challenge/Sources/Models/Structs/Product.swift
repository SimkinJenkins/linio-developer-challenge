//
//  Product.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 16/09/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation

/*
{
 "id": 2287014,
 "name": "Molde Rosca Clásica De Metal Queen Sense",
 "wishListPrice": 289,
 "slug": "molde-rosca-cla-sica-de-metal-queen-sense-trbphh",
 "url": "/mapi/v1/p/molde-rosca-cla-sica-de-metal-queen-sense-trbphh",
 "image": "https://i.linio.com/p/2a19511bb5fa692c880fcbee6141883f-product.jpg",
 "linioPlusLevel": 0,
 "conditionType": "new",
 "freeShipping": false,
 "imported": true,
 "active": true
}
*/

enum ProductConditionType: String {

    case new
    case refurbished
}

enum LinioPlusLevel: UInt {

    case none = 0
    case plus = 1
    case plus48 = 2
}

// Model for linio product

struct Product {

    let id: Int
    let name: String
    let wishListPrice: Double
    let slug: String
    let url: String
    let imageUrl: URL
    let linioPlusLevel: LinioPlusLevel
    let conditionType: ProductConditionType
    let freeShipping: Bool
    let imported: Bool
    let active: Bool

    private enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case wishListPrice
        case slug
        case url
        case imageUrl = "image"
        case linioPlusLevel
        case conditionType
        case freeShipping
        case imported
        case active
    }
}

extension Product: Decodable {

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        wishListPrice = try values.decode(Double.self, forKey: .wishListPrice)
        slug = try values.decode(String.self, forKey: .slug)
        url = try values.decode(String.self, forKey: .url)
        imageUrl = try values.decode(URL.self, forKey: .imageUrl)
        linioPlusLevel = LinioPlusLevel(rawValue: try values.decode(UInt.self, forKey: .linioPlusLevel))!
        conditionType = ProductConditionType(rawValue: try values.decode(String.self, forKey: .conditionType))!
        freeShipping = try values.decode(Bool.self, forKey: .freeShipping)
        imported = try values.decode(Bool.self, forKey: .imported)
        active = try values.decode(Bool.self, forKey: .active)
    }
}
