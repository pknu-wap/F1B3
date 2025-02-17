//
//  MentoringListView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class MentoringListView: BaseView {
    let mentoringListTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.Texts.mentoringCellIdentifier)
        return tableView
    }()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(mentoringListTableView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupTableViewLayout()
    }
    
    private func setupTableViewLayout() {
        mentoringListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mentoringListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mentoringListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mentoringListTableView.leftAnchor.constraint(equalTo: leftAnchor),
            mentoringListTableView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    func setTableViewDelegate(_ delegate: UITableViewDelegate & UITableViewDataSource) {
        mentoringListTableView.delegate = delegate
        mentoringListTableView.dataSource = delegate
    }
}
