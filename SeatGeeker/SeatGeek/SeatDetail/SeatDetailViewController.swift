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
    
    var event: Event!
    var img: UIImage?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favoritBtn: UIButton!
    @IBOutlet weak var seatImgView: UIImageView!
    @IBOutlet weak var seatDateLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
    }

}
