//
//  TodoModel.swift
//  todoListProj
//
//  Created by Pwang on 6/5/24.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isComplete: Bool = false
}

extension TodoModel {
    static var MOCK_DATA: [TodoModel] {
        get {
            return [
                TodoModel(title: "IOS App Dev"),
                TodoModel(title: "달리기 100바퀴 뛰기"),
                TodoModel(title: "개발 서적 완독하기"),
                TodoModel(title: "저녁 식사 요리하기"),
                TodoModel(title: "집에서 게임하기")
            ]
        }
    }
}
