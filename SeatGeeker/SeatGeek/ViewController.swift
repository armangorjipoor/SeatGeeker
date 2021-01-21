//
//  ViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 10/30/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var event = [Event]()
    private var eventViewModel: ViewModel!
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .green
        eventViewModel = ViewModel()
        getEvents()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let olsStr = "Arman Gorjipoor ios Developer"
        let newStr = olsStr.withReplacedCharacters(" ", by: "+")
        print("Looo: \(newStr)")
    }
    func getEvents() {
        
        eventViewModel.getData { welocom in
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
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SeatTableViewCell
        cell.titleLbl.text = eventViewModel.createTitle(index: event[indexPath.row])
        cell.cityLbl.text = event[indexPath.row].venue.city
        cell.dateLbl.text = event[indexPath.row].datetime_utc
        cell.seatImgView.downloaded(from: event[indexPath.row].performers.first!.image)
        return cell
    }
}

extension ViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Log")
        self.event.removeAll()
        self.tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("m;lm;lm")

        eventViewModel.query = searchText
        eventViewModel.getData { welocom in
                   self.event = welocom.events
                   DispatchQueue.main.async {
                       self.event = welocom.events
                       self.tableView.reloadData()
                    print("Log neta \(welocom.meta.total)")
                   }
            print("Log: \(self.event.count)")
               }
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}


/*
 cell.titleLbl.text = eventViewModel.createTitle(index: indexPath.row)
 cell.cityLbl.text = eventViewModel.eventsItem[index].venue.city
 //event[indexPath.row].venue.city
 cell.dateLbl.text = eventViewModel.eventsItem[index].datetime_utc
 cell.seatImgView.downloaded(from: eventViewModel.eventsItem[index].performers.first!.image)
 */
