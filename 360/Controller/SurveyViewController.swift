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
    
    var questionCount = 20
    
    let pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 500, height: 40))
    
    let labelCurrentPage : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
    
    var contentWidth:CGFloat = 0.0
    
    var lightGreen : UIColor = UIColor(red: 0.00, green: 0.74, blue: 0.00, alpha: 1.00)
    var whiteText : UIColor = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.delegate = self
        
        labelCurrentPage.frame.origin.x = view.frame.midX + 110
        labelCurrentPage.frame.origin.y = (view.frame.midY / 2) - 80
        labelCurrentPage.textAlignment = .center
        labelCurrentPage.text = "1/20"
        
        pageControl.frame.origin.x = view.frame.midX - 250
        pageControl.frame.origin.y = view.frame.midY
        pageControl.numberOfPages = 20
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        mainView.addSubview(pageControl)
        mainView.addSubview(labelCurrentPage)
        
        for i in 0...(questionCount - 1) {
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(i)
            
            let slider = UISlider(frame: CGRect(x: xCoordinate - 125, y: view.frame.midY, width: 250, height: 40))
            slider.minimumValue = 1
            slider.maximumValue = 10
            slider.thumbTintColor = lightGreen
            slider.tintColor = lightGreen
            slider.value = 5
            
            let questionView = UIView(frame: CGRect(x: xCoordinate - 150, y: view.frame.midY / 2 - 105, width: 300, height: 210))
            questionView.backgroundColor = lightGreen
            questionView.layer.cornerRadius = 20
            
            let labelToDisplay = UILabel(frame: CGRect(x: xCoordinate - 125, y: (view.frame.midY / 2) - 100, width: 250, height: 200))
            labelToDisplay.text = "\(i+1). Some example text for testing number, very large text very large text very large text very large text very large text very large text very large text\(i+1)"
            labelToDisplay.lineBreakMode = .byWordWrapping
            labelToDisplay.numberOfLines = 0
            labelToDisplay.textColor = whiteText
            
            let labelMax = UILabel(frame: CGRect(x: xCoordinate + 110, y: view.frame.midY + 30, width: 40, height: 40))
            let labelMin = UILabel(frame: CGRect(x: xCoordinate - 150, y: view.frame.midY + 30, width: 40, height: 40))
            labelMin.text = "0"
            labelMax.text = "10"
            labelMin.textAlignment = .center
            labelMax.textAlignment = .center
            
            scrollView.addSubview(labelMax)
            scrollView.addSubview(labelMin)
            scrollView.addSubview(slider)
            scrollView.addSubview(questionView)
            scrollView.addSubview(labelToDisplay)
            
            contentWidth += view.frame.width
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: 1.0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        labelCurrentPage.text = "\(Int(pageNumber) + 1)/\(questionCount)"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
