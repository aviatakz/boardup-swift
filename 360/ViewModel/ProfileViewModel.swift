//
//  ProfileViewModel.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/10/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Moya
import Kingfisher
import Alamofire
class ProfileViewModel {
    var userImage = UIImageView()
    var nameAndsurnameLabel = UILabel()
    var emailAddressLabel = UILabel()

    let provider = MoyaProvider<MyService>(plugins: [AccessTokenPlugin { _ in LocalData.token }])
//    let provider = MoyaProvider<MyService>()
    func fetchData() {
        provider.request(.getSingleUser(userId: LocalData.userId)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        print(String(bytes: moyaResponse.data, encoding: .utf8))
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let user = try filteredResponse.map(User.self) // user is of type User
                        let url = URL(string: user.photo ?? "https://lh3.googleusercontent.com/a-/AOh14Ggvty4ioOpYjEgsv9IPVukR-yUyLhlkHO-Qcal-")
                        self.userImage.kf.setImage(with: url)
                        self.nameAndsurnameLabel.text = user.username
                        self.emailAddressLabel.text = user.email
                    }catch{
                        print("Error with decoding user  \(error)")
                        // Here we get either statusCode error or objectMapping error.
                        // TODO: handle the error == best. comment. ever.
                    }
            case .failure(_): break
                    // TODO: handle the error == best. comment. ever.
                }

        }
    }
    
}
