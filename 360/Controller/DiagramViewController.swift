//
//  DiagramViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/17/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Charts
import Moya
class DiagramViewController: UIViewController {
    @IBOutlet weak var diagramView: UIView!
    @IBOutlet weak var numberOfEvalutedLabel: UILabel!
    @IBOutlet weak var dateEvalutedLabel: UILabel!
    let provider = MoyaProvider<MyService>()
    var radarChart = RadarChart()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateChartView()
        provider.request(.getInterviewsResults(userId: 16, surveyId: 41)) { result in
        switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let results = try filteredResponse.map(Results.self) // user is of
                    self.radarChart.setData(Category: results.categories, entryS: results.`self`, entryCol: results.colleagues, entryCom: results.company)
                    self.updateChartView()
                }catch{
                    print("Error with decoding user\(error)")
                    // Here we get either statusCode error or objectMapping error.
                    // TODO: handle the error == best. comment. ever.
                }
        case .failure(_): break
                // TODO: handle the error == best. comment. ever.
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

