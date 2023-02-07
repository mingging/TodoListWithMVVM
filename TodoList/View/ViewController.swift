//
//  ViewController.swift
//  TodoList
//
//  Created by milli on 2023/02/06.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Property
    
    private var todoListViewModel: TodoListViewModel = TodoListViewModel()
    
    private let emptyView = NoListView()
    
    private let todoListTableView = UITableView().then {
        $0.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationViewModel()
        
        setUpNavigationBar()
        setUpUI()
    }
    
    // MARK: - Selector

    @objc func selectAddListButton() {
        let addListViewController = AddListViewController(viewModel: todoListViewModel)
        self.navigationController?.pushViewController(addListViewController, animated: true)
    }
    
    private func configurationViewModel() {
        todoListViewModel.reloadTableView = reloadTableView
    }
    
    private func reloadTableView() {
        todoListTableView.reloadData()
        emptyView.alpha = todoListViewModel.items.isEmpty ? 1 : 0
    }
    
    // MARK: - UI
    
    /// 네비게이션 바 세팅
    private func setUpNavigationBar() {
        self.title = "Todo List 📝"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(selectAddListButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(todoListTableView)
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
        todoListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.view.addSubview(emptyView)
        emptyView.alpha = todoListViewModel.items.isEmpty ? 1 : 0
        emptyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListViewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = todoListViewModel.items[indexPath.row]
        let identifier = "LIST_\(indexPath.row)_\(item)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = TodoListTableViewCell.init(reuseIdentifier: identifier)
        cell.titleLabel.text = item.title ?? ""
        cell.checkImageView.image = UIImage(systemName: item.isCompleted ? "checkmark.circle" : "circle")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = todoListViewModel.items[indexPath.row]
        todoListViewModel.updateItem(item: item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListViewModel.deleteItem(index: indexPath.row)
        }
    }
}
