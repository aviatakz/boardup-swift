//
//  SurveyViewModel.swift
//  360
//
//  Created by Адиль on 9/16/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import Moya

class SurveyViewModel {
    var questionCount = 10
    var questionsList = [Question]()
    var surveyId: Int = 30
    var interviewId: Int = 33
    let provider = MoyaProvider<MyService>()
    
    func loadData(group: DispatchGroup) {
        self.provider.request(.getSurveyList(id: self.surveyId)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let data = try moyaResponse.filterSuccessfulStatusCodes().data
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        guard let questionsList = try? decoder.decode([Question].self, from: data) else { return }
                        self.questionsList = questionsList
                        DispatchQueue.main.async {
                            group.leave()
                        }
                    }catch{
                        print("Error with decoding user\(error)")
                    }
            case .failure(_): break
                }
        }
    }
    
    func sendAllGrades(sliders: [UISlider], comment: String) {
        for i in 0...(self.questionsList.count - 1) {
            let grade = Grade(id: 1, value: Int(sliders[i].value), questionId: self.questionsList[i].id, interviewId: self.interviewId)
            print(grade)
            self.provider.request(.createGrades(grade: grade)) { result in
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    _ = moyaResponse.statusCode
                    print(String(data: data, encoding: .utf8) as Any)
                case .failure(_): break
                }
            }
        }
        self.provider.request(.editInterview(interviewId: self.interviewId, surveyId: self.surveyId, comment: comment)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data // Data, your JSON response is probably in here!
                _ = moyaResponse.statusCode // Int - 200, 401, 500, etc
                print(String(data: data, encoding: .utf8) as Any)
            case .failure(_): break
            }
        }
    }
}
