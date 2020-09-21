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
    var viewModel = QuestionsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = true
        NotificationCenter.default.addObserver(self,
        selector: #selector(doThisWhenNotify),
        name: NSNotification.Name(rawValue: Key.Identifier.myNotificationKey),
        object: nil)
        viewModel.interviewListSelf.bind { _ in
            self.tableView.reloadData()
            self.progressBar.progress = self.viewModel.getProgress()
        }
        viewModel.fetchData()
    }
    
    @objc func doThisWhenNotify() {
        viewModel.fetchData()
    }
}
//MARK: - delegate and DataSource
extension QuestionsViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getCountSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getSectionCount(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.Identifier.cell, for: indexPath) as! PersonTableViewCell
        viewModel.setData(cell, cellForRowAt: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let width = tableView.frame.width
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 40))
        view.backgroundColor = .systemGray6
        let  lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 60))
        lbl.text = viewModel.getSectionName(viewForHeaderInSection: section)
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.getInterviewUser(didSelectRowAt: indexPath)
        performSegue(withIdentifier: Key.Identifier.afterQuestions, sender: self)
    }
}

