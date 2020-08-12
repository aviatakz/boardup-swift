//
//  DataFromApi.swift
//  360
//
//  Created by Adilzhan Akhayev on 7/23/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import RxSwift
struct DataFromApi {
    static let rest = RestManager()
    static func getSingleUser(id:Int,completion: @escaping (User) -> ())  {
        guard let url = URL(string: "http://46.101.246.71:8000/users/\(id)") else { return }
        rest.urlQueryParameters.add(value: "json", forKey: "format")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do{
                    let user = try decoder.decode(User.self, from: data)
                    completion(user)
                }catch{
                    print(error)
                }
            }
        }
    }
    
    
    
    static func getInterviewsResults (user_id:Int,survey_id: Int,completion: @escaping (Results) -> ()) {
        guard let url = URL(string: "http://46.101.246.71:8000/interviews/results/") else { return }
        rest.urlQueryParameters.add(value: "\(user_id)", forKey: "user_id")
        rest.urlQueryParameters.add(value: "\(survey_id)", forKey: "survey_id")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
                    if let data = results.data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        guard let results = try? decoder.decode(Results.self, from: data) else { return }
                        completion(results)
                    }
                }
    }
    
    static func getInterviewList(id: Int,completion: @escaping ([InterviewList]) -> ()) -> (){
        guard let url = URL(string: "http://46.101.246.71:8000/interviews/") else { return }
        rest.urlQueryParameters.add(value: "\(id)", forKey: "user")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let interviewList = try? decoder.decode([InterviewList].self, from: data) else { return }
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
                LocalData.token = tokenUser.token
                LocalData.userId = tokenUser.user.id ?? 1
                defaults.set(tokenUser.user.id, forKey: "userID")
           }
    }
    
    
    static func getSurveyList(id:Int,completion: @escaping (Survey) -> ())  {
            guard let url = URL(string: "http://46.101.246.71:8000/surveys/\(id)") else { return }
            rest.urlQueryParameters.add(value: "json", forKey: "format")
            rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
                if let data = results.data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let survey = try? decoder.decode(Survey.self, from: data) else { return }
                    completion(survey)
                }
            }
        }
    
  
    static func createGrades(grade: Grade) {
        guard let url = URL(string: "http://46.101.246.71:8000/grades/") else { return }
        let bodyData = "value=\(grade.value)&question_id=\(grade.questionId)&interview_id=\(grade.interviewId)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let dataString = String(data: data, encoding: String.Encoding.utf8) {
                    print(dataString)
                }
            } else {
                print(error ?? "Error???")
            }
        }.resume()
    }
}



