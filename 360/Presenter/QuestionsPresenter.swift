//
//  QustionsPresenter.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/13/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class QuestionsPresenter: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var objectsArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        
        objectsArray = [Objects(sectionNAme: "Оценить", sectionObject: ["Akhayev Adil","Matilda Brown","Matilda Brown","Matilda Brown"]),Objects(sectionNAme: "Прошли оценку", sectionObject: ["Matilda Brown","Matilda Brown"])]
    }
}
struct Objects {
        var sectionNAme: String?
        var sectionObject: [String]?
    }


extension QuestionsPresenter: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersoneTVC
        
        cell.PersoneNameSurnameLBL.text = objectsArray[indexPath.section].sectionObject?[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionNAme
    }
    
    
}

