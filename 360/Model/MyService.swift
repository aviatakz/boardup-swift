//
//  MyService.swift
//  360
//
//  Created by Adilzhan Akhayev on 8/13/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//
import Moya
import UIKit
enum MyService {
    case requestToken(token: String)
    case getSingleUser(userId:Int)
    case getInterviewsResults (userId:Int,surveyId: Int)
    case getInterviewList(userId: Int)
    case getSurveyList(id:Int)
    case createGrades(grade: Grade)
}

extension MyService: TargetType{
    var baseURL: URL {
        return URL(string: "http://46.101.246.71:8000")!
    }
    
    var path: String {
        switch self {
        case .requestToken( _):
            return "/auth/google/"
        case .getSingleUser(let usereId):
            return "/users/\(usereId)"
        case .getInterviewsResults( _, _):
            return "/interviews/results"
        case .getInterviewList( _):
            return "/interviews"
        case .getSurveyList(let id):
            return "/surveys/\(id)"
        case .createGrades( _):
            return "/grades"
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .requestToken,.createGrades:
            return .post
        case .getSingleUser,.getInterviewsResults,.getInterviewList,.getSurveyList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .requestToken(token: let token):
            return .requestParameters(parameters: ["access_token":token], encoding: URLEncoding.queryString)
        case .getSingleUser(userId: _):
            return .requestPlain
        case .getInterviewsResults(userId: let userId, surveyId: let surveyId):
            return .requestParameters(parameters: ["user_id":userId,"survey_id":surveyId], encoding: URLEncoding.queryString)
        case .getInterviewList(userId: let userId):
            return .requestParameters(parameters: ["user":"\(userId)"], encoding: URLEncoding.queryString)
        case .getSurveyList(id: _):
            return .requestParameters(parameters: ["format":"json"], encoding: URLEncoding.queryString)
        case .createGrades(grade: let grade):
            return .requestParameters(parameters: ["value":"\(grade.value)","question_id":"\(grade.questionId)","interview_id":"\(grade.interviewId)"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]//["Content-type": "application/json","Cookie": ""]
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

