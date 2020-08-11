//
//  DiagramViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/17/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Charts

class DiagramViewController: UIViewController {
    @IBOutlet weak var diagramView: UIView!
    @IBOutlet weak var numberOfEvalutedLabel: UILabel!
    @IBOutlet weak var dateEvalutedLabel: UILabel!
    var radarChart = RadarChart()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateChartView()
        DataFromApi.getInterviewsResults(user_id: 16, survey_id: 41) { (results) in
            DispatchQueue.main.async{
            self.radarChart.setData(Category: results.categories, entryS: results.`self`, entryCol: results.colleagues, entryCom: results.company)
                self.updateChartView()
            }
        }
    }
    
    
    @IBAction func allSwitch(_ sender: UISwitch) {
        diagramView.subviews[0].removeFromSuperview()
        radarChart.takeSet(Set: sender.tag)
        updateChartView()
    }
    
    
    func updateChartView(){
        diagramView.addSubview(radarChart.createChartView())
    }

    
}

