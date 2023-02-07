//
//  AddListViewController.swift
//  TodoList
//
//  Created by milli on 2023/02/07.
//

import UIKit

class AddListViewController: UIViewController {
    
    // MARK: - Property
    
    private var todoListViewModel: TodoListViewModel!

    private let todoTextField = UITextField().then {
        $0.backgroundColor = .systemGray6
        $0.placeholder = "오늘의 TODO를 입력해주세요."
        $0.layer.cornerRadius = 5
    }
    
    private lazy var saveButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.setTitle("저장", for: .normal)
        $0.addTarget(self, action: #selector(selectSaveButton), for: .touchUpInside)
    }
    
    init(viewModel: TodoListViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.todoListViewModel = viewModel
        
        setUpNavigationBar()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Selector
    
    @objc func selectSaveButton() {
        guard let text = todoTextField.text else { return }
        todoListViewModel.addItem(title: text)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UI
    
    private func setUpNavigationBar() {
        self.title = "Add an Item 🖊"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(todoTextField)
        todoTextField.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        self.view.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.top.equalTo(todoTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
}
