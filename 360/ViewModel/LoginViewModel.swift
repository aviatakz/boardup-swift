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
                    let tokenJWTandUser = try decoder.decode(Token.self, from: data)
                    print("JWT: \(tokenJWTandUser.token)")
                    LocalData.token = tokenJWTandUser.token
                    LocalData.userId = tokenJWTandUser.user.id
                }catch{
                    print("Error with decoding News: \(error)")
                }
            case .failure(_): break
                // TODO: handle the error == best. comment. ever.
            }
        }
    }
}
