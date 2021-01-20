//
//  SeatTableViewCell.swift
//  SeatGeeker
//
//  Created by ArmanG on 11/1/1399 AP.
//  Copyright © 1399 Pars Digital. All rights reserved.
//

import UIKit

class SeatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var seatImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        seatImgView.layer.cornerRadius = seatImgView.bounds.height * (30/100)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
