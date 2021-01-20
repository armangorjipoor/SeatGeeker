//
//  ViewModel.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/1/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    private var apiService: APIServices!
    private(set) var empData: Welcome! {
        didSet {
            self.bindViewModelToController()
        }
    }
    private let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MjE1MDk2MTF8MTYxMTA4NTA5Ny40NDQ2NDM3&per_page=10")!
    var eventItem = [Event]()
    
    var bindViewModelToController: (() -> ()) = { }
    
    override init() {
        super.init()
        self.apiService = APIServices()
       
    }
    
    
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
