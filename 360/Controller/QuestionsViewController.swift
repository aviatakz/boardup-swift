//
//  QuestionsViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Kingfisher

class QuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var progressBar: UIProgressView!
    
    let defaults = UserDefaults.standard
    
    var objectsArray: [Objects]  = [Objects(sectionNAme: "Оценить",done: false, sectionObject: []),Objects(sectionNAme: "Прошли оценку",done: true, sectionObject: [])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = true
        // Do any additional setup after loading the view.
        loadData()
    }
    
    func loadData() {
        DataFromApi.getInterviewList(id: 15) { (results) in
            for user in results{
//                if user.isDone{
//                    self.objectsArray[1].sectionObject!.append(user.targetUser)
//                }else{
//                    self.objectsArray[0].sectionObject!.append(user.targetUser)
//                }
                self.objectsArray[0].sectionObject!.append(user)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.progressBar.progress = self.getProgress()
            }
        }
    }
    
}


extension QuestionsViewController: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.Identifier.cell, for: indexPath) as! PersonTableViewCell  // getCell
                
        if objectsArray[indexPath.section].done!{
            cell.doneColorView.backgroundColor = .systemGray5
        }else{
            cell.doneColorView.backgroundColor = .systemGreen
        }
        if let stringUrl = objectsArray[indexPath.section].sectionObject?[indexPath.row].targetUser.photo{
            let url = URL(string: stringUrl)
            cell.personeImg.kf.setImage(with: url)
        }
        cell.personeInfoLabel.text = objectsArray[indexPath.section].sectionObject?[indexPath.row].targetUser.groups[0].name
        cell.personeNameAndSurnameLalel.text = objectsArray[indexPath.section].sectionObject?[indexPath.row].targetUser.username
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let width = tableView.frame.width
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let users = objectsArray[0].sectionObject{
            let user = users[indexPath.row]
            print(user.surveyId)
            print(user.id)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let secondViewController = storyboard.instantiateViewController(identifier: "SurveyViewController") as? SurveyViewController else { return }
            secondViewController.interviewId = user.id
            secondViewController.interviewId = user.surveyId
            
            show(secondViewController, sender: nil)
            
            
        }
    }
    
    
    
    func getProgress() -> Float{
           let answer = Float(getDoneCount()) / Float(getAllTaskCount())
           return answer
    }
       

    func getDoneCount() -> Int {
       return objectsArray[1].sectionObject!.count
    }


    func getAllTaskCount() -> Int {
       var answer = 0
       for i in objectsArray{
           for _ in i.sectionObject!{
               answer += 1
           }
       }
       return answer
    }
    
}

