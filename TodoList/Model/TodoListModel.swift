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
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCompleted
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        isCompleted = (try? values.decode(Bool.self, forKey: .id)) ?? false
    }
    
    /// 투두리스트 완료 시 업데이트
    func updateCompletion() -> TodoListModel {
        return TodoListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
