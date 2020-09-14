//
//  QuestionsViewModel.swift
//  360
//
//  Created by Adilzhan Akhayev on 9/15/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import Kingfisher
import Moya
class QuestionsViewModel {
    private var objectsArray: [Objects]  = [Objects(sectionNAme: "Оценить",done: false, sectionObject: []),Objects(sectionNAme: "Прошли оценку",done: true, sectionObject: [])]
    var interviewListSelf = Observable<[InterviewList]>([])
    
    func fetchData() {
    let provider = MoyaProvider<MyService>(plugins: [AccessTokenPlugin { _ in LocalData.token}])
        provider.request(.getInterviewList(userId: 16)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let data = try moyaResponse.filterSuccessfulStatusCodes().data
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        guard let interviewList = try? decoder.decode([InterviewList].self, from: data) else { return }
                        for user in interviewList{
                            if user.isDone ?? false{
                                self.objectsArray[1].sectionObject.append(user)
                                        }else{
                                self.objectsArray[0].sectionObject.append(user)
                                        }
                                    }
                        self.interviewListSelf.value.append(contentsOf: interviewList)
                    }catch{
                        print("Error with decoding Questions \(error)")
                    }
            case .failure(_): break
                }
        }
    }
    
    func setData(_ cell: PersonTableViewCell,cellForRowAt indexPath: IndexPath) {
        if objectsArray[indexPath.section].done{
            cell.doneColorView.backgroundColor = .systemGray5
        }else{
            cell.doneColorView.backgroundColor = .systemGreen
        }
        if let stringUrl = objectsArray[indexPath.section].sectionObject[indexPath.row].targetUser?.photo{
            let url = URL(string: stringUrl)
            cell.personeImg.kf.setImage(with: url)
        }
        cell.personeNameAndSurnameLalel.text = objectsArray[indexPath.section].sectionObject[indexPath.row].targetUser?.username
    }
    
    func getSectionCount(numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObject.count
    }
    
    func getCountSection() -> Int {
        return objectsArray.count
    }
    
    func getProgress() -> Float{
        if objectsArray[1].sectionObject.count == 0 {
            return 0
        }
        let answer = Float(objectsArray[1].sectionObject.count) / Float(interviewListSelf.value.count)
        return answer
    }

    func getSectionName(viewForHeaderInSection section: Int) -> String {
        return objectsArray[section].sectionNAme
    }
    
    func getInterviewUser(didSelectRowAt indexPath: IndexPath) -> InterviewList{
        let users = objectsArray[0].sectionObject
        let user = users[indexPath.row]
        return user
    }
    
}
