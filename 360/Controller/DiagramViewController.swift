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

