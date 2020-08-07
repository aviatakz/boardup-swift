//
//  SurveyViewController.swift
//  360
//
//  Created by Адиль Медеуев on 7/19/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var questionCount = 10
    
    var questionsList = [Question]()
    
    var sliders = [UISlider]()
    
    let pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 500, height: 40))
    
    let labelCurrentPage : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    
    var contentWidth : CGFloat = 0.0
    
    var lightGreen : UIColor = UIColor(red: 0.00, green: 0.74, blue: 0.00, alpha: 1.00)
    var whiteText : UIColor = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
    
    var customFont : UIFont = UIFont(name: "Montserrat", size: 17)!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let group = DispatchGroup()
        group.enter()
        
        DataFromApi.getSurveyList(id: 33) { (survey) in
            DispatchQueue.main.sync {
                self.questionCount = survey.questions.count
                self.questionsList = survey.questions
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            
            self.scrollView.delegate = self
            
            self.labelCurrentPage.frame.origin.x = self.view.frame.midX + 110
            self.labelCurrentPage.frame.origin.y = (self.view.frame.midY / 2) - 80
            self.labelCurrentPage.textAlignment = .center
            self.labelCurrentPage.text = "1/\(self.questionCount)"
            self.labelCurrentPage.font = self.customFont
            
            self.pageControl.frame.origin.x = self.view.frame.midX - 250
            self.pageControl.frame.origin.y = self.view.frame.midY
            self.pageControl.numberOfPages = self.questionCount
            self.pageControl.currentPageIndicatorTintColor = .black
            self.pageControl.pageIndicatorTintColor = .lightGray
            
            self.mainView.addSubview(self.pageControl)
            self.mainView.addSubview(self.labelCurrentPage)
            
            for i in 0...(self.questionCount - 1) {
                let xCoordinate = self.view.frame.midX + self.view.frame.width * CGFloat(i)
                
                let slider = UISlider(frame: CGRect(x: xCoordinate - 125, y: self.view.frame.midY, width: 250, height: 40))
                slider.minimumValue = 0
                slider.maximumValue = 10
                slider.thumbTintColor = self.lightGreen
                slider.tintColor = self.lightGreen
                slider.value = 5
                self.sliders.append(slider)
                
                let questionView = UIView(frame: CGRect(x: xCoordinate - 150, y: self.view.frame.midY / 2 - 105, width: 300, height: 210))
                questionView.backgroundColor = self.lightGreen
                questionView.layer.cornerRadius = 20
                
                let labelToDisplay = UILabel(frame: CGRect(x: xCoordinate - 125, y: (self.view.frame.midY / 2) - 100, width: 250, height: 200))
                labelToDisplay.text = "\(i+1). \(self.questionsList[i].description)"
                
                labelToDisplay.lineBreakMode = .byWordWrapping
                labelToDisplay.numberOfLines = 0
                labelToDisplay.textColor = self.whiteText
                labelToDisplay.font = self.customFont
                
                let labelMax = UILabel(frame: CGRect(x: xCoordinate + 110, y: self.view.frame.midY + 30, width: 40, height: 40))
                let labelMin = UILabel(frame: CGRect(x: xCoordinate - 150, y: self.view.frame.midY + 30, width: 40, height: 40))
                
                labelMin.text = "0"
                labelMax.text = "10"
                labelMin.textAlignment = .center
                labelMax.textAlignment = .center
                labelMin.font = self.customFont
                labelMax.font = self.customFont
                
                self.scrollView.addSubview(labelMax)
                self.scrollView.addSubview(labelMin)
                self.scrollView.addSubview(slider)
                self.scrollView.addSubview(questionView)
                self.scrollView.addSubview(labelToDisplay)
                self.contentWidth += self.view.frame.width
            }
            
            let sendButton = UIButton(type: .system)
            sendButton.frame = CGRect(x: self.contentWidth - self.view.frame.midX - 50, y: self.view.frame.midY * 1.4, width: 100, height: 50)
            sendButton.setTitle("Отправить", for: .normal)
            sendButton.tintColor = self.whiteText
            sendButton.backgroundColor = self.lightGreen
            sendButton.addTarget(self, action: #selector(self.sendAllGrades(sender:)), for: .touchUpInside)
            
            self.scrollView.addSubview(sendButton)
            
            self.scrollView.contentSize = CGSize(width: self.contentWidth, height: 1.0)
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        labelCurrentPage.text = "\(Int(pageNumber) + 1)/\(self.questionCount)"
    }
    
    @objc func sendAllGrades(sender: UIButton!) {
        for i in 0...(self.questionsList.count - 1) {
            let grade = Grade(id: 1, value: Int(self.sliders[i].value), questionId: self.questionsList[i].id, interviewId: 4)
            DataFromApi.createGrades(grade: grade)
        }
    }
}
