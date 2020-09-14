//
//  DiagramViewModel.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Charts
import Moya
class DiagramViewModel {
    private var radarChart = RadarChart()
    var radarView = Observable<Bool>(false)
    func fetchData() {
        let provider = MoyaProvider<MyService>(plugins: [AccessTokenPlugin { _ in LocalData.token}])
        provider.request(.getInterviewsResults(userId: 16, surveyId: 41)) { result in //for test user id 16 suvey id 41
        switch result {
            case let .success(moyaResponse):
                do {
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let results = try filteredResponse.map(Results.self)
                    self.radarChart.setData(Category: results.categories, entryS: results.`self`, entryCol: results.colleagues, entryCom: results.company)
                    self.take()
                }catch{
                    print("Error with decoding diagram result \(error)")
                }
        case .failure(_): break
            }
        }
    }
    func updateView(view: UIView) {
        if view.subviews.count > 0{
            view.subviews[0].removeFromSuperview()
            view.addSubview(giveView())
        }else{
            view.addSubview(giveView())
        }
    }

    func takeSwitch(_ key: Int) {
        radarChart.takeSet(Set: key)
        take()
    }
    private func giveView() -> UIView {
        radarChart.createChartView()
    }
    private func take() {
        self.radarView.value = !self.radarView.value
    }
}
