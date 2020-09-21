//
//  LoginViewModel.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Moya
class LoginViewModel {
    private let provider = MoyaProvider<MyService>()
    func setJWT(from token: String) {
        self.provider.request(.requestToken(token: token)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = try moyaResponse.filterSuccessfulStatusCodes().data
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let tokenAndUser = try decoder.decode(Token.self, from: data)
                    LocalData.token = tokenAndUser.token
                    LocalData.userId = tokenAndUser.user.id
                    self.setSurveyId()
                    NotificationCenter.default.post(name: Notification.Name(rawValue: Key.Identifier.myNotificationKey), object: self)
                }catch{
                    print("Error with decoding News: \(error)")
                }
            case .failure(_): break
            }
        }
    }
    
    func setSurveyId() {
        let provider = MoyaProvider<MyService>(plugins: [AccessTokenPlugin { _ in LocalData.token}])
        provider.request(.getSurveyList(id: LocalData.userId)) { result in
        switch result {
            case let .success(moyaResponse):
                    do {
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let results = try filteredResponse.map(Survey.self)
                        if results.is_active{
                            LocalData.surveyId = results.id
                        }
                    }catch{
                        print("Error with decoding survey result \(error)")
                    }
            case .failure(_): break
                }
        }
    }
}
