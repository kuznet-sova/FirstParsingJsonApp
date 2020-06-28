//
//  Location.swift
//  FirstParsingJsonApp
//
//  Created by Ирина Кузнецова on 21.06.2020.
//  Copyright © 2020 Irina Kuznetsova. All rights reserved.
//

struct Location: Decodable {
    let slug: String?
    let type: String?
    let tags: [String]?
    let imageURL: String?
}
