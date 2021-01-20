//
//  ViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 10/30/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var event = [Event]()
    private var eventViewModel: ViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    func getData() {
        
        eventViewModel = ViewModel()
        eventViewModel.getData{ welocom in
            self.event = welocom.events
            DispatchQueue.main.async {
                self.event = welocom.events
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SeatTableViewCell
        cell.titleLbl.text = eventViewModel.createTitle(event: event[indexPath.row])
        cell.cityLbl.text = event[indexPath.row].venue.city
        cell.dateLbl.text = event[indexPath.row].datetime_utc
        cell.seatImgView.downloaded(from: event[indexPath.row].performers.first!.image)
        return cell
    }
    
    
}
