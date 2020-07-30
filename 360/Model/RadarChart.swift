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
    
    private var yourisOn:Bool = false
    private var collegisOn:Bool = false
    private var companyisOn:Bool = false
    
    
    
    
    let Characteristic = ["Отзывчивость", "Упорство", "Дисциплинированность", "Ответственность", "Решимость"]
    
    func generalRadarChart() -> RadarChartView {
        let chartView = RadarChartView(frame: CGRect(x: 0, y: 0, width: 350, height: 350))
            
            // General
            chartView.backgroundColor = .white
            chartView.webLineWidth = 1.0
            chartView.innerWebLineWidth = 1.0
            chartView.webColor = NSUIColor.lightGray
            chartView.innerWebColor = NSUIColor.lightGray
            chartView.webAlpha = 1.0
            
            // xAxis
            let xAxis = chartView.xAxis
            xAxis.labelFont = NSUIFont(name: Key.textStyle.fontStyle, size: CGFloat(6.0))!
            xAxis.xOffset = 0.0
            xAxis.yOffset = 0.0
            xAxis.labelTextColor = NSUIColor.black
            xAxis.valueFormatter = RadarChartXValueFormatter(withLabels: Characteristic)
        
            
            
            // yAxis
            let yAxis = chartView.yAxis
            yAxis.labelFont = NSUIFont(name: Key.textStyle.fontStyle, size: CGFloat(9.0))!
            yAxis.labelCount = 5
            yAxis.axisMinimum = 0.0
            yAxis.axisMaximum = 80.0
            yAxis.drawLabelsEnabled = false
        
            // Legend
            let legend = chartView.legend
            legend.enabled = false
        
            // animated
            chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
            return chartView
    }
    
    func creatSet(entries: [RadarChartDataEntry],color: UIColor) -> RadarChartDataSet {
        let set = RadarChartDataSet(entries: entries)
        set.colors = [color]
        set.fillColor = color
        set.drawFilledEnabled = true
        set.fillAlpha = 0.5
        set.lineWidth = 2.0
        set.drawHighlightCircleEnabled = true
        set.setDrawHighlightIndicators(false)
        
        return set
        
    }
    func getEntries(number:Int) -> [RadarChartDataEntry] {
        let entries1 = [RadarChartDataEntry(value: 30),RadarChartDataEntry(value: 20),RadarChartDataEntry(value: 80),RadarChartDataEntry(value: 30),RadarChartDataEntry(value: 50)]
        
        let entries2 = [RadarChartDataEntry(value: 80),RadarChartDataEntry(value: 70),RadarChartDataEntry(value: 60),RadarChartDataEntry(value: 50),RadarChartDataEntry(value: 40)]
        
        let entries3 = [RadarChartDataEntry(value: 10),RadarChartDataEntry(value: 20),RadarChartDataEntry(value: 30),RadarChartDataEntry(value: 40),RadarChartDataEntry(value: 50)]
        
        let entries4 = [RadarChartDataEntry(value: 0),RadarChartDataEntry(value: 0),RadarChartDataEntry(value: 0),RadarChartDataEntry(value: 0),RadarChartDataEntry(value: 0)]
        
        
        
        let answer = [entries1,entries2,entries3,entries4]
        
        
        return answer[number]
    }
    
    
    func creatSets() -> [RadarChartDataSet] {
        
        var sets: [RadarChartDataSet] = []
        
        let set1 = creatSet(entries: getEntries(number: 0), color: UIColor(named: Key.colors.your)!)
        let set2 = creatSet(entries: getEntries(number: 1), color: UIColor(named: Key.colors.collegues)!)
        let set3 = creatSet(entries: getEntries(number: 2), color: UIColor(named: Key.colors.company)!)
        let set4 = creatSet(entries: getEntries(number: 3), color: .clear)
        sets.append(set4)
        if yourisOn{
            sets.append(set1)
        }
        if collegisOn{
            sets.append(set2)
        }
        if companyisOn{
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
        let chartView = generalRadarChart()
        chartView.data = getRadarChartData(withThese: creatSets())
        
        return chartView
    }
    
    
    mutating func takeSet(Set key: Int)  {
        if key == 0{
            self.yourisOn = self.yourisOn ? false:true
        }
        if key == 1{
            self.collegisOn = self.collegisOn ? false:true
        }
        if key == 2{
            self.companyisOn = self.companyisOn ? false:true
        }
        
    }
}
