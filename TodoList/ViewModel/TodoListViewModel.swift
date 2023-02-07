//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by milli on 2023/02/07.
//

import Foundation

class TodoListViewModel: NSObject {
    var items: [TodoListModel] = [] {
        didSet {
            saveItems()
            updateDataSource()
        }
    }
    
    private let itemsKey: String = "ITEMS_LIST"
    
    var reloadTableView: (() -> Void)?
    
    override init() {
        super.init()
        getItems()
    }
    
    /// 아이템 가져오기
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([TodoListModel].self, from: data)
        else { return }
        
        /// UserDefault에서 저장된 아이템 가져와서 저장시키기
        self.items = savedItems
    }
    
    /// 아이템 추가
    func addItem(title: String, completion: (() -> ())? = nil) {
        let newItem = TodoListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    /// 아이템 저장
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    /// 아이템 체크하기
    func updateItem(item: TodoListModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    /// 아이템 삭제
    func deleteItem(index: Int) {
        items.remove(at: index)
    }
    
    func updateDataSource() {
        self.reloadTableView?()
    }
}
