//
//  SeatDetailViewController.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/2/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit

class SeatDetailViewController: UIViewController {

    var event: Event!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favoritBtn: UIButton!
    @IBOutlet weak var seatImgView: UIImageView!
    @IBOutlet weak var seatDateLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = event.type
        seatImgView.downloaded(from: event.performers.first!.image)
        seatDateLbl.text = event.datetime_utc
        addressLbl.text = event.venue.address
    }
    
    override func viewDidLayoutSubviews() {
        seatImgView.layer.cornerRadius = seatImgView.bounds.height * (20/100)
    }

}
