//
//  String+Extension.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/3/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

extension String {
    func withReplacedCharacters(_ oldChar: String, by newChar: String) -> String {
        let newStr = self.replacingOccurrences(of: oldChar, with: newChar, options: .literal, range: nil)
        return newStr
    }
}
