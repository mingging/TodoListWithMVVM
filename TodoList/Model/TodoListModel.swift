//
//  TodoListModel.swift
//  TodoList
//
//  Created by milli on 2023/02/07.
//

import Foundation

struct TodoListModel: Codable {
    let id: String?
    let title: String?
    let isCompleted: Bool
    
    init(id: String? = UUID().uuidString, title: String?, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    /// 투두리스트 완료 시 업데이트
    func updateCompletion() -> TodoListModel {
        return TodoListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
