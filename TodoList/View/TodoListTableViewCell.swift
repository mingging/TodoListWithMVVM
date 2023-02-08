//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by milli on 2023/02/07.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    // MARK: - Property
    
    let titleLabel = UILabel().then {
        $0.text = "dummmy"
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    let checkImageView = UIImageView().then {
        $0.image = UIImage(systemName: "circle")
    }
    
    init(reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
       
        self.contentView.addSubview(checkImageView)
        checkImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkImageView.snp.trailing).offset(10)
        }
    }
}
