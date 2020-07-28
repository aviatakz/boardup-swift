//
//  RadarChartXValueFormatter.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/22/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Charts
class RadarChartXValueFormatter: NSObject, IAxisValueFormatter {

  init(withLabels labels: String...) {
    self.labels = labels
    super.init()
  }

  init(withLabels labels: [String]) {
    self.labels = labels
    super.init()
  }

  var labels: [String]

  func stringForValue(_ value: Double, axis: AxisBase?) -> String {
    let index = Int(value)
    return labels.indices ~= index ? labels[index] : ""
  }

}
