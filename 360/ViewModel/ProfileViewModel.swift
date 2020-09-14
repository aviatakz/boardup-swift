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
class ProfileViewModel {
    var userInfo = Observable<[User]>([])
    
    func fetchData() {
        let provider = MoyaProvider<MyService>(plugins: [AccessTokenPlugin { _ in LocalData.token}])
        provider.request(.getSingleUser(userId: LocalData.userId)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let user = try filteredResponse.map(User.self) // user is of type User
                        self.userInfo.value.append(user)
                    }catch{
                        print("Error with decoding user  \(error)")
                    }
            case .failure(_): break
                }
        }
    }
    
    func getUser() -> User? {
        guard let user = userInfo.value.first else {
            return nil
        }
        return user
    }
    
    func setData(image: UIImageView,nameandSurname:UILabel,email:UILabel){
        if let user = getUser(){
            nameandSurname.text = "\(user.first_name ?? "")  \(user.last_name ?? "")"
            email.text = user.email
            let url = URL(string: user.photo ?? "")
            image.kf.setImage(with: url)
        }
    }
}
