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
    
    let mentoringCreateButton: UIButton = MentoringCreateButton()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(mentoringListTableView)
        addSubview(mentoringCreateButton)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupTableViewLayout()
        setupCreateButtonLayout()
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
    
    private func setupCreateButtonLayout() {
        mentoringCreateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mentoringCreateButton.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -10
            ),
            mentoringCreateButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            mentoringCreateButton.widthAnchor.constraint(
                equalToConstant: 170
            ),
            mentoringCreateButton.heightAnchor.constraint(
                equalToConstant: 54
            ),
        ])
    }
    
    func setTableViewDelegate(_ delegate: UITableViewDelegate & UITableViewDataSource) {
        mentoringListTableView.delegate = delegate
        mentoringListTableView.dataSource = delegate
    }
    
    func addCreateButtonAction(_ action: UIAction) {
        mentoringCreateButton.addAction(action, for: .touchUpInside)
    }
}
