//
//  DateConversation.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/3/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

class DateConversation {
    let dateFormatter: DateFormatter
    
    init() {
        self.dateFormatter = DateFormatter()
    }
    
    func getDate(from str : String) -> Date {
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: str)!
    }
}
