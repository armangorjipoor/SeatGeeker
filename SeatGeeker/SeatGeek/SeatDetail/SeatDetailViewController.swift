//
//  SeatDetailViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/2/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit

class SeatDetailViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateCons = DateConversation()
    
    let alertController = UIAlertController(title: "Remove Event", message: "Do you want remove your fav event ?", preferredStyle: .alert)
    // Below for when app is online
    var event: Event!
    var img: UIImage?
    var photoMgr = PhotoManager()
    
    // when app is Offline
    var isFavoriteAvailable: Bool = false
    var favoriteModel: FavoriteModel!
    var favoriteEvent: SeatEvent!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favoritBtn: UIButton!
    @IBOutlet weak var seatImgView: UIImageView!
    @IBOutlet weak var seatDateLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFavoriteAvailable {
            configueWithDB()
        } else {
            configueAsNormal()
        }
    }
    
    func configueWithDB() {
        favoritBtn.isSelected = true
//        titleLbl.text = favoriteModel.eventType
//        seatImgView.image = favoriteModel.eventImage
//        seatDateLbl.text = dateCons.getString(from: favoriteModel.eventDate)
//        addressLbl.text = favoriteModel.eventAddress
        titleLbl.text = favoriteEvent.type
        seatImgView.image = photoMgr.load(image: favoriteEvent.imgURL!)
        seatDateLbl.text = dateCons.getString(from: favoriteEvent.date!)
        addressLbl.text = favoriteEvent.address
        
    }
    
    func configueAsNormal() {
         favoriteEvent = SeatEvent(entity: SeatEvent.entity(), insertInto: context)
        titleLbl.text = event.type
        seatImgView.image = self.img
        seatDateLbl.text = event.datetime_utc
        addressLbl.text = event.venue.address
    }
    override func viewDidLayoutSubviews() {
        seatImgView.layer.cornerRadius = seatImgView.bounds.height * (20/100)
    }
    
    @IBAction func favoritBtnTapped(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = !sender.isSelected
            save()
        } else if sender.isSelected == true {
            sender.isSelected = !sender.isSelected
            unSave()
        }
    }

    func save() {
        let photoMgr = PhotoManager()
        photoMgr.image = self.img!
        favoriteEvent.type = event.type
        favoriteEvent.date = dateCons.getDate(from: event.datetime_utc)
        favoriteEvent.address = event.venue.address
        favoriteEvent.imgURL = photoMgr.save(eventID: event.id)
        appDelegate.saveContext()

        Utilities.getDBFilePathWith(mark: "Log")
    }
    
    func unSave() {
        alertController.addAction(UIAlertAction(title: "Yes, delete it", style: .destructive, handler: { _ in
            self.context.delete(self.favoriteEvent)
            self.appDelegate.saveContext()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
            self.dismiss(animated: true, completion: nil)
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
            self.favoritBtn.isSelected = true
            
        }))
        self.present(alertController, animated: true)
         Utilities.getDBFilePathWith(mark: "Log")
        
    }
}




/*
 
 
 
 
 
 
 */
