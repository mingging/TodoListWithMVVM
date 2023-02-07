//
//  NoListView.swift
//  TodoList
//
//  Created by milli on 2023/02/07.
//

import UIKit

class NoListView: UIView {
     
    private let emptyLabel = UILabel().then {
        $0.text = "작성된 TODO가 없습니다."
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .systemGray2
        $0.textAlignment = .center
    }
    
    init() {
        super.init(frame: .zero)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.backgroundColor = .white
        
        self.addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
