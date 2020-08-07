//
//  QuestionsData.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/24/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import UIKit

struct QuestionsData{
    var objectsArray: [Objects]  = [Objects(sectionNAme: "Оценить",done: false, sectionObject: []),Objects(sectionNAme: "Прошли оценку",done: true, sectionObject: [])]

    
//        for user in users{
////                        if user.isDone{
////                            self.objectsArray[0].sectionObject?.append(user.targetUser)
////                        }else{
////                            self.objectsArray[1].sectionObject?.append(user.targetUser)
////                        }
//            self.objectsArray[0].sectionObject?.append(user)
//        }
        
    
   
//    mutating func loadUserArray(){
//        DataFromApi.getInterviewList(id: 15) { (results) in
//            for user in results{
//                self.objectsArray[0].sectionObject!.append(user.targetUser)
//            }
//        }
//    }
    

    func getQuestionsDataCount() -> Int {
        return objectsArray.count
    }
    
    
    func getQuestionsSectionCount(numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObject?.count ?? 0
    }
    
    
    func getCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> PersonTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.Identifier.cell, for: indexPath) as! PersonTableViewCell  // getCell
            
        if objectsArray[indexPath.section].done!{
            cell.doneColorView.backgroundColor = .systemGray5
        }else{
            cell.doneColorView.backgroundColor = .systemGreen
        }
    
        cell.personeNameAndSurnameLalel.text = objectsArray[indexPath.section].sectionObject?[indexPath.row].username
        return cell
    }
    
    
    func getView(ViewWidth width: CGFloat,viewForHeaderInSection section: Int) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
        view.backgroundColor = .systemGray6
        let  lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 60))
        lbl.text = objectsArray[section].sectionNAme
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(lbl)
        return view
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
