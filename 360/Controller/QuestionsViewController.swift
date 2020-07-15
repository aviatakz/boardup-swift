//
//  QuestionsViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var objectsArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        
        objectsArray = [Objects(sectionNAme: "Оценить",done: false, sectionObject: ["Akhayev Adil","Matilda Brown","Matilda Brown","Matilda Brown"]),Objects(sectionNAme: "Прошли оценку",done: true, sectionObject: ["Matilda Brown","Matilda Brown"])]
    }
}
struct Objects {
        var sectionNAme: String?
        var done: Bool?
        var sectionObject: [String]?
    
    }


extension QuestionsViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersoneTVC
        if objectsArray[indexPath.section].done!{
            cell.DoneColorView.backgroundColor = .systemGray5
        }else{
            cell.DoneColorView.backgroundColor = .systemGreen
        }
    
        cell.PersoneNameSurnameLBL.text = objectsArray[indexPath.section].sectionObject?[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        view.backgroundColor = .systemGray6
        
        let  lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 60))
        lbl.text = objectsArray[section].sectionNAme
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(lbl)
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
    //MARK: - Progress View
 
    @IBDesignable
class CustomProgressBar: UIView {
        @IBInspectable var color: UIColor? = .gray
        var progress: CGFloat = 0.68
        
        override func draw(_ rect: CGRect) {
            let backgroundMask = CAShapeLayer()
            backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
            layer.mask = backgroundMask
            
            let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
            
            let progressLayer = CALayer()
            
            progressLayer.frame = progressRect
            progressLayer.accessibilityPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25)
            
            let label = CATextLayer()
            label.frame =  CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
            label.string = "\(Int(progress*100))%"
            label.alignmentMode = .right
            
            label.fontSize = 19
            progressLayer.addSublayer(label)
            
            layer.addSublayer(progressLayer)
            progressLayer.backgroundColor = color?.cgColor
        }
}
