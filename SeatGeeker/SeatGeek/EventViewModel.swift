//
//  ViewModel.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/1/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    var eventsItem = [Event]()
    var query: String! {
        didSet {
            if query.count != 0 {
               let replacedQuery =  query.withReplacedCharacters(" ", by: "+")
                url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE1MDk2MTF8MTYxMTA4NTA5Ny40NDQ2NDM3&q=\(replacedQuery)&per_page=25")!
                
            }
        }
    }
    lazy var url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE1MDk2MTF8MTYxMTA4NTA5Ny40NDQ2NDM3&per_page=25")!
    
   // var bindViewModelToController: (() -> ()) = { }
    
    override init() {
        super.init()
        
    }
    
    
    func getData(completion: @escaping (Welcome) -> ()) {
        print(eventsItem.count)
        URLSession.shared.dataTask(with: url ) {
            data, respone , error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let eventData = try! jsonDecoder.decode(Welcome.self, from: data)
                self.eventsItem = eventData.events
                completion(eventData)
            }
        }.resume()
    }
    
    func createTitle(index: Event) -> String{
        return index.type + " at " + index.venue.city
    }
    
}
