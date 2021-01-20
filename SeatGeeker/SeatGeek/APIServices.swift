//
//  APIServices.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/1/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation


class APIServices: NSObject {
    private let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE1MDk2MTF8MTYxMTA4NTA5Ny40NDQ2NDM3&per_page=40")!
    func getData(completion: @escaping (Welcome) -> ()) {
        URLSession.shared.dataTask(with: url ) {
            data, respone , error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let eventData = try! jsonDecoder.decode(Welcome.self, from: data)
                completion(eventData)
            }
        }.resume()
    }
}
