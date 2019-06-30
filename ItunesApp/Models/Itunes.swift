//
//  Itunes.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation

//structuring model objects to json format
struct Root: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Media]
}

struct Media: Codable {
    let name: String
    let artworkUrl100: String
    let url: String
}
