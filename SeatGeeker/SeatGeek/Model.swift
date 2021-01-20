//
//  M.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/1/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let events: [Event]
    let meta: Meta
}

struct Meta: Codable {
    let total: Int
    let took: Int
    let page: Int
    let per_page: Int
}
struct Event: Codable {
    let type: String 
    let id: Int
    let datetime_utc: String
    let venue: Venue
    let performers: [Performer]
    
    
}
struct Venue: Codable {
    let state: String
    let name: String
    let timezone: String
    let url: String
    let address: String
    let country: String
    let city: String
}
struct Performer: Codable {
    let name: String
    let image: String
    let id: Int
    let images: Images
}
struct Images: Codable {
    let huge: String
}
