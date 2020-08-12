//
//  RadarChart.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/23/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Charts

struct RadarChart {
    let chartView = RadarChartView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
    private var yourIsOn:Bool = false
    private var collegIsOn:Bool = false
    private var companyIsOn:Bool = false
    private var Characteristic: [String] = []
    private var entrySelf: [RadarChartDataEntry] = []
    private var entryColleagues: [RadarChartDataEntry] = []
    private var entryCompany: [RadarChartDataEntry] = []
    
    mutating func setData(Category: [Categories],entryS: [ResultAVG],entryCol: [ResultAVG],entryCom: [ResultAVG]) {
        for i in 0..<Category.count{
            self.Characteristic.append(Category[i].name)
        }
        for i in 0..<entryS.count{
                    self.entrySelf.append(RadarChartDataEntry(value:Double(entryS[i].avg)))
                }
        for i in 0..<entryCol.count{
                    self.entryColleagues.append(RadarChartDataEntry(value:Double(entryCol[i].avg)))
                }
        for i in 0..<entryCom.count{
                    self.entryCompany.append(RadarChartDataEntry(value:Double(entryCom[i].avg)))
                }
    }
    

    func creatSets() -> [RadarChartDataSet] {
        var sets: [RadarChartDataSet] = []
        let set1 = RadarChartDataSet(entries: entrySelf)
        set1.colors = [UIColor(named: Key.colors.your)!]
        set1.fillColor = UIColor(named: Key.colors.your)!
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.5
        set1.lineWidth = 2.0
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)
        let set2 = RadarChartDataSet(entries: entryColleagues)
        set2.colors = [UIColor(named: Key.colors.collegues)!]
        set2.fillColor = UIColor(named: Key.colors.collegues)!
        set2.drawFilledEnabled = true
        set2.fillAlpha = 0.5
        set2.lineWidth = 2.0
        set2.drawHighlightCircleEnabled = true
        set2.setDrawHighlightIndicators(false)
        let set3 = RadarChartDataSet(entries: entryCompany)
        set3.colors = [UIColor(named: Key.colors.company)!]
        set3.fillColor = UIColor(named: Key.colors.company)!
        set3.drawFilledEnabled = true
        set3.fillAlpha = 0.5
        set3.lineWidth = 2.0
        set3.drawHighlightCircleEnabled = true
        set3.setDrawHighlightIndicators(false)
        if yourIsOn{
            sets.append(set1)
        }
        if collegIsOn{
            sets.append(set2)
        }
        if companyIsOn{
            sets.append(set3)
        }
        return sets
    }
    
    
    func getRadarChartData(withThese sets: [RadarChartDataSet]) -> RadarChartData {
            let data = RadarChartData(dataSets: sets)
            data.setValueFont ( NSUIFont(name: Key.textStyle.fontStyle, size: CGFloat(8.0))!)
            data.setDrawValues ( false )
            data.setValueTextColor(  NSUIColor.black)
            data.setValueTextColor(.brown)
            return data
    }
    
    
    func createChartView() -> RadarChartView {
            // General
            chartView.backgroundColor = .white
            chartView.webLineWidth = 1.0
            chartView.innerWebLineWidth = 1.0
            chartView.webColor = NSUIColor.lightGray
            chartView.innerWebColor = NSUIColor.lightGray
            chartView.webAlpha = 1.0
            // xAxis
            let xAxis = chartView.xAxis
            xAxis.labelFont = NSUIFont(name: Key.textStyle.fontStyle, size: CGFloat(2.0))!
            xAxis.xOffset = 0.0
            xAxis.yOffset = 0.0
            xAxis.labelTextColor = NSUIColor.black
            xAxis.valueFormatter = RadarChartXValueFormatter(withLabels: Characteristic)
            // yAxis
            let yAxis = chartView.yAxis
            yAxis.labelFont = NSUIFont(name: Key.textStyle.fontStyle, size: CGFloat(9.0))!
            yAxis.labelCount = 5
            yAxis.axisMinimum = 0.0
            yAxis.axisMaximum = 8.0
            yAxis.drawLabelsEnabled = false
            // Legend
            let legend = chartView.legend
            legend.enabled = false
            // animated
            chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
            chartView.data = getRadarChartData(withThese: creatSets())
            return chartView
    }
    
    
    mutating func takeSet(Set key: Int)  {
        if key == 0{
            self.yourIsOn = self.yourIsOn ? false:true
        }
        if key == 1{
            self.collegIsOn = self.collegIsOn ? false:true
        }
        if key == 2{
            self.companyIsOn = self.companyIsOn ? false:true
        }
    }
}
