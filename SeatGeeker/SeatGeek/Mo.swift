//
//  ViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 10/30/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

// MARK: - Welcome
/*struct Welcome: Codable {
    let events: [Event]
  //  let meta: Meta
    let inHand: InHand

    enum CodingKeys: String, CodingKey {
        case events, meta
        case inHand = "in_hand"
    }
}

// MARK: - Event
struct Event: Codable {
    let type: String //NameEnum
    let id: Int
    let datetimeUTC: String
    let venue: Venue
    let datetimeTbd: Bool
    let performers: [Performer]
    let isOpen: Bool
    let links: [JSONAny]
    let datetimeLocal: String
    let timeTbd: Bool
    let shortTitle, visibleUntilUTC: String
    let stats: EventStats
    let taxonomies: [Taxonomy]
    let url: String
    let score: Double
    let announceDate, createdAt: String
    let dateTbd: Bool
    let title: String
    let popularity: Double
    let eventDescription, status: String
   // let accessMethod: AccessMethod?
   // let eventPromotion: JSONNull?
//    let announcements: InHand
    let conditional: Bool
  //  let enddatetimeUTC: JSONNull?
  //  let themes, domainInformation: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case type, id
        case datetimeUTC = "datetime_utc"
        case venue
        case datetimeTbd = "datetime_tbd"
        case performers
        case isOpen = "is_open"
        case links
        case datetimeLocal = "datetime_local"
        case timeTbd = "time_tbd"
        case shortTitle = "short_title"
        case visibleUntilUTC = "visible_until_utc"
        case stats, taxonomies, url, score
        case announceDate = "announce_date"
        case createdAt = "created_at"
        case dateTbd = "date_tbd"
        case title, popularity
        case eventDescription = "description"
        case status
        case accessMethod = "access_method"
       // case eventPromotion = "event_promotion"
        case announcements, conditional
      //  case enddatetimeUTC = "enddatetime_utc"
      //  case themes
      //  case domainInformation = "domain_information"
    }
}

// MARK: - AccessMethod
struct AccessMethod: Codable {
    let method: String
    let createdAt: Date
    let employeeOnly: Bool

    enum CodingKeys: String, CodingKey {
        case method
        case createdAt = "created_at"
        case employeeOnly = "employee_only"
    }
}

// MARK: - InHand
struct InHand: Codable {
}

// MARK: - Performer
struct Performer: Codable {
    let type: PerformerType
    let name: String
    let image: String
    let id: Int
    let images: Images
    let divisions: [Division]?
    let hasUpcomingEvents: Bool
    let primary: Bool?
    let stats: PerformerStats
    let taxonomies: [Taxonomy]
    let imageAttribution: String?
    let url: String
    let score: Double
    let slug: String
    let homeVenueID: Int?
    let shortName: String
    let numUpcomingEvents: Int
    let colors: Colors?
    let imageLicense: String?
    let popularity: Int
    let homeTeam: Bool?
    let location: Location?
    let awayTeam: Bool?

    enum CodingKeys: String, CodingKey {
        case type, name, image, id, images, divisions
        case hasUpcomingEvents = "has_upcoming_events"
        case primary, stats, taxonomies
        case imageAttribution = "image_attribution"
        case url, score, slug
        case homeVenueID = "home_venue_id"
        case shortName = "short_name"
        case numUpcomingEvents = "num_upcoming_events"
        case colors
        case imageLicense = "image_license"
        case popularity
        case homeTeam = "home_team"
        case location
        case awayTeam = "away_team"
    }
}

// MARK: - Colors
struct Colors: Codable {
    let all: [String]
    let iconic: String
    let primary: [String]
}

// MARK: - Division
struct Division: Codable {
    let taxonomyID: Int
    let shortName: String?
    let displayName: String
    let displayType: DisplayType
    let divisionLevel: Int
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case taxonomyID = "taxonomy_id"
        case shortName = "short_name"
        case displayName = "display_name"
        case displayType = "display_type"
        case divisionLevel = "division_level"
        case slug
    }
}

enum DisplayType: String, Codable {
    case conference = "Conference"
    case division = "Division"
}

// MARK: - Images
struct Images: Codable {
    let huge: String
}

// MARK: - Location
struct Location: Codable {
    let lat, lon: Double
}

// MARK: - PerformerStats
struct PerformerStats: Codable {
    let eventCount: Int

    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
}

// MARK: - Taxonomy
struct Taxonomy: Codable {
    let id: Int
    let name: NameEnum
    let parentID: Int?
    let documentSource: DocumentSource?
    let rank: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
        case documentSource = "document_source"
        case rank
    }
}

// MARK: - DocumentSource
struct DocumentSource: Codable {
    let sourceType: SourceType
    let generationType: GenerationType

    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case generationType = "generation_type"
    }
}

enum GenerationType: String, Codable {
    case full = "FULL"
}

enum SourceType: String, Codable {
    case elastic = "ELASTIC"
}

enum NameEnum: String, Codable {
    case basketball = "basketball"
    case dancePerformanceTour = "dance_performance_tour"
    case nba = "nba"
    case sports = "sports"
    case theater = "theater"
}

enum PerformerType: String, Codable {
    case nba = "nba"
    case theaterDancePerformanceTour = "theater_dance_performance_tour"
}

// MARK: - EventStats
struct EventStats: Codable {
    let listingCount, averagePrice, lowestPriceGoodDeals, lowestPrice: Int?
    let highestPrice, visibleListingCount: Int?
    let dqBucketCounts: [Int]?
    let medianPrice, lowestSgBasePrice, lowestSgBasePriceGoodDeals: Int?

    enum CodingKeys: String, CodingKey {
        case listingCount = "listing_count"
        case averagePrice = "average_price"
        case lowestPriceGoodDeals = "lowest_price_good_deals"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
        case visibleListingCount = "visible_listing_count"
        case dqBucketCounts = "dq_bucket_counts"
        case medianPrice = "median_price"
        case lowestSgBasePrice = "lowest_sg_base_price"
        case lowestSgBasePriceGoodDeals = "lowest_sg_base_price_good_deals"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let state, nameV2, postalCode, name: String
 //   let links: [JSONAny]
    let timezone: String
    let url: String
    let score: Double
    let location: Location
    let address, country: String
    let hasUpcomingEvents: Bool
    let numUpcomingEvents: Int
    let city, slug, extendedAddress: String
    let id, popularity: Int
    let accessMethod: AccessMethod?
    let metroCode, capacity: Int
    let displayLocation: String

    enum CodingKeys: String, CodingKey {
        case state
        case nameV2 = "name_v2"
        case postalCode = "postal_code"
        case name, links, timezone, url, score, location, address, country
        case hasUpcomingEvents = "has_upcoming_events"
        case numUpcomingEvents = "num_upcoming_events"
        case city, slug
        case extendedAddress = "extended_address"
        case id, popularity
        case accessMethod = "access_method"
        case metroCode = "metro_code"
        case capacity
        case displayLocation = "display_location"
    }
}

// MARK: - Meta
//struct Meta: Codable {
//    let total, took, page, perPage: Int
//    let geolocation: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case total, took, page
//        case perPage = "per_page"
//        case geolocation
//    }
//} */


