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
    
    // Below for when app is online
    var event: Event!
    var img: UIImage?
    
    // when app is Offline
    var isFavoriteAvailable: Bool = false
    var favoriteModel: FavoriteModel!
    
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
        titleLbl.text = favoriteModel.eventType
        seatImgView.image = favoriteModel.eventImage
        seatDateLbl.text = dateCons.getString(from: favoriteModel.eventDate)
        addressLbl.text = favoriteModel.eventAddress
    }
    
    func configueAsNormal() {
        titleLbl.text = event.type
        seatImgView.image = self.img
        seatDateLbl.text = event.datetime_utc
        addressLbl.text = event.venue.address
    }
    override func viewDidLayoutSubviews() {
        seatImgView.layer.cornerRadius = seatImgView.bounds.height * (20/100)
    }
    
    @IBAction func favoritBtnTapped(_ sender: UIButton) {
       

    
        
        let favoriteEvent = SeatEvent(entity: SeatEvent.entity(), insertInto: context)
        let photoMgr = PhotoManager()
        photoMgr.image = self.img!
        favoriteEvent.type = event.type
        favoriteEvent.date = dateCons.getDate(from: event.datetime_utc)
        favoriteEvent.address = event.venue.address
        favoriteEvent.imgURL = photoMgr.save(eventID: event.id)
        appDelegate.saveContext()

        Utilities.getDBFilePathWith(mark: "Log")
        
        if sender.isSelected == false {
            sender.isSelected = !sender.isSelected
        } else if sender.isSelected == true {
            sender.isSelected = !sender.isSelected
        }
        

        
    }

}

/*
 alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: nil))
    alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
 //self.present(alertController, animated: true)

 let alertController = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
 */
