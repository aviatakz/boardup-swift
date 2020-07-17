//
//  DiagramViewController.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/17/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import RadarChartView

class DiagramViewController: UIViewController {
    @IBOutlet weak var DiagramView: UIView!
    
    @IBOutlet weak var NumberOfEvalutedLabel: UILabel!
    @IBOutlet weak var DateEvalutedLabel: UILabel!
    var yourisOn:Bool = true
    var collegisOn:Bool = true
    var companyisOn:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateChart()
    }
    func UpdateChart() {
        DiagramView.addSubview(getChartView())
    }
    func getChartView() -> RadarChartView {
        let chartView = RadarChartView()
        chartView.dataSets = getData()
        chartView.titles = ["Отзывчивость", "Упорство", "Дисциплинированность", "Ответственность", "Решимость"]
        chartView.webTitles = ["20", "40", "60", "80", "100"]
        chartView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        chartView.backgroundColor = .systemGray6
        return chartView
    }
    func getData() -> [ChartDataSet] {
        var SetArray: [ChartDataSet] = []
        if yourisOn{
            SetArray.append(getYourSet())
        }
        if collegisOn{
            SetArray.append(getColleguesSet())
        }
        if companyisOn{
            SetArray.append(getCompanySet())
        }
        
        return SetArray
    }
    func getYourSet() -> ChartDataSet {
        var YourSet = ChartDataSet()
        YourSet.entries = [ChartDataEntry(value: 100),
                            ChartDataEntry(value: 70),
                            ChartDataEntry(value: 80),
                            ChartDataEntry(value: 40),
                            ChartDataEntry(value: 90)]
        YourSet.fillColor = (UIColor(named: "YourColor") ?? UIColor.red).withAlphaComponent(0.5)
        YourSet.strokeColor = UIColor(named: "YourColor") ?? UIColor.white
        return YourSet
    }
    func getColleguesSet() -> ChartDataSet {
        var ColleguesSet = ChartDataSet()
        ColleguesSet.entries = [ChartDataEntry(value: 50),
                            ChartDataEntry(value: 50),
                            ChartDataEntry(value: 70),
                            ChartDataEntry(value: 90),
                            ChartDataEntry(value: 70)]
        ColleguesSet.fillColor = (UIColor(named: "ColleguesColor") ?? UIColor.green).withAlphaComponent(0.5)
        ColleguesSet.strokeColor = UIColor(named: "ColleguesColor") ?? UIColor.white
        return ColleguesSet
    }
    func getCompanySet() -> ChartDataSet {
        var CompanySet = ChartDataSet()
        CompanySet.entries = [ChartDataEntry(value: 100),
                            ChartDataEntry(value: 30),
                            ChartDataEntry(value: 20),
                            ChartDataEntry(value: 20),
                            ChartDataEntry(value: 60)]
        
        
        
        CompanySet.fillColor = (UIColor(named: "CompanyColor") ?? UIColor.yellow).withAlphaComponent(0.5)
        CompanySet.strokeColor = UIColor(named: "CompanyColor") ?? UIColor.white
        return CompanySet
    }

    @IBAction func YourSwitch(_ sender: UISwitch) {
        yourisOn = sender.isOn
        UpdateChart()
    }
    @IBAction func ColleguesSwitch(_ sender: UISwitch) {
        collegisOn = sender.isOn
        UpdateChart()
    }
    @IBAction func CompanySwitch(_ sender: UISwitch) {
        companyisOn = sender.isOn
        UpdateChart()
    }
    
}
