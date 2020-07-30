//
//  DataFromApi.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/23/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

struct DataFromApi {
    static let rest = RestManager()
    
    static func getSingleUser(id:Int,completion: @escaping (User) -> ())  {
        guard let url = URL(string: "http://46.101.246.71:8000/users/\(id)") else { return }
        rest.urlQueryParameters.add(value: "json", forKey: "format")
        print(url)
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            
            if let data = results.data {
                print(data)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let user = try? decoder.decode(User.self, from: data) else { return }
//                print(user)
                
                completion(user)
                
            }
        }
    }
    
    static func getSurveyList(id:Int,completion: @escaping (User) -> ())  {
            guard let url = URL(string: "http://46.101.246.71:8000/surveys/\(id)") else { return }
            rest.urlQueryParameters.add(value: "json", forKey: "format")
            print(url)
            rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
                
                if let data = results.data {
                    print(data)
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let user = try? decoder.decode(User.self, from: data) else { return }
    //                print(user)
                    
                    completion(user)
                    
                }
            }
        }
    
}

