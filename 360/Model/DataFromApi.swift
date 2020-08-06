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
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let user = try? decoder.decode(User.self, from: data) else { return }
                completion(user)
                
            }
        }
    }
    
    
    static func getInterviewList(id: Int,completion: @escaping ([InterviewList]) -> ()) -> (){
        guard let url = URL(string: "http://46.101.246.71:8000/interviews/") else { return }
        
        rest.urlQueryParameters.add(value: "\(id)", forKey: "user")
        print (url)
        
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                print(data)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let interviewList = try? decoder.decode([InterviewList].self, from: data) else { return }
//                print(interviewList.count)
                completion(interviewList)
                
            }
        }
    }
    
    
    static func requestToken(token: String) {
            guard let url = URL(string: "http://46.101.246.71:8000/auth/google/") else { return }
            rest.httpBodyParameters.add(value: token, forKey: "access_token")
            rest.requestHttpHeaders.add(value: "", forKey: "Cookie")
            rest.makeRequest(toURL: url, withHttpMethod: .post) { (results) in
                guard results.response != nil else { return }
                guard let data = results.data else { return }
                let decoder = JSONDecoder()
                guard let tokenUser = try? decoder.decode(Token.self, from: data) else { return }
                let defaults = UserDefaults.standard
                defaults.set(tokenUser.user.id, forKey: "userID")
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



