//
//  QuakeLocation.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import Foundation
struct QuakeLocation: Decodable {
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longitude: Double { properties.products.origin.first!.properties.longitude }
    private var properties: RootProperties
    
    struct RootProperties: Decodable {
        //구조체 배열을 하나의 객체로 만듦
        var products: Products
    }
    struct Products: Decodable {
        //구조체 배열로 만듦
        var origin: [Origin]
    }
    struct Origin: Decodable {
        //변수 2개 저장된 구조체
        var properties: OriginProperties
    }
    
    //변수 2개
    struct OriginProperties {
        var latitude: Double
        var longitude: Double
    }
}

extension QuakeLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
        let longitude = try container.decode(String.self, forKey: .longitude)
        let latitude = try container.decode(String.self, forKey: .latitude)
        guard let longitude = Double(longitude),
              let latitude = Double(latitude) else { throw QuakeError.missingData }
        self.longitude = longitude
        self.latitude = latitude
    }
}

/*
 QuakeLocation
 ├── latitude: Double
 ├── longitude: Double
 └── properties: RootProperties
 └── products: Products
 └── origin: [Origin]
 └── properties: OriginProperties
 ├── latitude: Double
 └── longitude: Double
 
 
 QuakeLocation
 +--------------------------------+
 | latitude: Double               |
 | longitude: Double              |
 | properties: RootProperties     |
 +--------------------------------+
 |
 |
 v
 RootProperties
 +--------------------------------+
 | products: Products             |
 +--------------------------------+
 |
 |
 v
 Products
 +--------------------------------+
 | origin: [Origin]               |
 +--------------------------------+
 |
 |
 v
 Origin
 +--------------------------------+
 | properties: OriginProperties   |
 +--------------------------------+
 |
 |
 v
 OriginProperties
 +--------------------------------+
 | latitude: Double               |
 | longitude: Double              |
 +--------------------------------+
 
 
 */

