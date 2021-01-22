//
//  SeatEvent+CoreDataProperties.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/3/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//
//

import Foundation
import CoreData


extension SeatEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeatEvent> {
        return NSFetchRequest<SeatEvent>(entityName: "SeatEvent")
    }

    @NSManaged public var type: String?
    @NSManaged public var date: Date?
    @NSManaged public var address: String?
    @NSManaged public var imgURL: String?

}
