//
//  PersoneTVC.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/14/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
@IBDesignable
class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var subContentTVCview: UIView!
    @IBOutlet weak var personeImg: UIImageView!
    @IBOutlet weak var personeNameAndSurnameLalel: UILabel!
    @IBOutlet weak var personeInfoLabel: UILabel!
    @IBOutlet weak var doneColorView: UIView!
    
    
    let viewDesign = ViewDesign()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
               personeImg.image = UIImage(named: "person")
               personeImg.layer.cornerRadius = personeImg.frame.size.width / 2
               personeImg.clipsToBounds = true
        subContentTVCview.layer.cornerRadius = 7
        subContentTVCview.layer.masksToBounds = true
        
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

}
