//
//  PersoneTVC.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/14/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class PersoneTVC: UITableViewCell {

    @IBOutlet weak var ContentTVCview: UIView!
    @IBOutlet weak var PersoneImg: UIImageView!
    @IBOutlet weak var PersoneNameSurnameLBL: UILabel!
    @IBOutlet weak var PersoneInfoLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
               PersoneImg.image = UIImage(named: "person")
               PersoneImg.layer.cornerRadius = PersoneImg.frame.size.width / 2
               PersoneImg.clipsToBounds = true
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
