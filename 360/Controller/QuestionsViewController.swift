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
    @IBOutlet var progressBar: UIProgressView!
    
    var questionsData = QuestionsData()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.allowsSelection = true
        // Do any additional setup after loading the view.
        progressBar.progress = questionsData.getProgress()
        
    }
    
}

extension QuestionsViewController: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questionsData.getQuestionsDataCount()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsData.getQuestionsSectionCount(numberOfRowsInSection: section)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return questionsData.getCell(tableView, cellForRowAt: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let width = tableView.frame.width
        
        return questionsData.getView(ViewWidth: width, viewForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defaults.set(indexPath.row, forKey: Key.defaultsKey.numberOfQuestion)
        self.performSegue(withIdentifier: Key.Identifier.afterQuestions, sender: self)
    }
    
    
}

