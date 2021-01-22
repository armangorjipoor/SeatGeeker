//
//  SeatFavoriteViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/3/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit
import CoreData

class SeatFavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var fetchedRc: NSFetchedResultsController<SeatEvent>!
    private var photoMgr = PhotoManager()
    private var dateCons = DateConversation()
    private var favoriteModel: FavoriteModel!
    private var event: SeatEvent!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventsFromDatabase()
    }
    
    func getEventsFromDatabase () {
        let request = SeatEvent.fetchRequest() as NSFetchRequest<SeatEvent>
        let sort = NSSortDescriptor(key: #keyPath(SeatEvent.date), ascending: true)
        request.sortDescriptors = [sort]
        do{
            fetchedRc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            try fetchedRc.performFetch()
        }catch let err as NSError {
            print("khata :\(err.userInfo)")
        }
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let index = sender as? IndexPath {
            let seatDetail = segue.destination as! SeatDetailViewController
            let favoriteEvent = fetchedRc.object(at: index)
                seatDetail.isFavoriteAvailable = true
                seatDetail.favoriteModel = FavoriteModel(eventImage: photoMgr.load(image: event.imgURL!)!, eventId: Int(event.id), eventDate: event.date!, eventAddress: event.address!, eventType: event.type!)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedRc.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! SeatTableViewCell
        event = fetchedRc.object(at: indexPath)
        cell.titleLbl.text = event.type
        cell.dateLbl.text = dateCons.getString(from: event.date!)
        cell.seatImgView.image = photoMgr.load(image: event.imgURL!)
        cell.cityLbl.text = event.address
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailVC", sender: indexPath)
    }

}
