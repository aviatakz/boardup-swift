//
//  PersoneTVC.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/14/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
@IBDesignable
class PersoneTVC: UITableViewCell {

    @IBOutlet weak var ContentTVCview: UIView!
    @IBOutlet weak var subContentTVCview: UIView!
    @IBOutlet weak var PersoneImg: UIImageView!
    @IBOutlet weak var PersoneNameSurnameLBL: UILabel!
    @IBOutlet weak var PersoneInfoLBL: UILabel!
    @IBOutlet weak var DoneColorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
               PersoneImg.image = UIImage(named: "person")
               PersoneImg.layer.cornerRadius = PersoneImg.frame.size.width / 2
               PersoneImg.clipsToBounds = true
        subContentTVCview.layer.cornerRadius = 7
        subContentTVCview.layer.masksToBounds = true
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
