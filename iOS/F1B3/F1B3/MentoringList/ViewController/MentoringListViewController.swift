//
//  MentoringListViewController.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit
import Combine
import SwiftUI

final class MentoringListViewController: BaseViewController {
    
    private let mentoringManager: MentoringManager
    private let mentoringListView: MentoringListView
    private var cancellables = Set<AnyCancellable>()
    
    init(mentoringManager: MentoringManager) {
        self.mentoringManager = mentoringManager
        self.mentoringListView = MentoringListView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = mentoringListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        mentoringCreateButtonDidTapAction()
        bindMentoringList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mentoringManager.fetchMentorings()
    }
    
    override func setupNavigationBar() {
        let label = UILabel()
        label.textColor = UIColor(named: Constants.Texts.color)!
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = Constants.Texts.appName
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: Constants.Texts.searchIcon),
            style: .plain,
            target: self,
            action: #selector(didTapSetting)
        )
        
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func didTapSetting() {
        print("Hello")
    }
    
    private func setupTableView() {
        mentoringListView.setTableViewDelegate(self)
    }
    
    private func bindMentoringList() {
        mentoringManager.$mentoringList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.mentoringListView.mentoringListTableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func mentoringCreateButtonDidTapAction() {
        mentoringListView.addCreateButtonAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                
                let createMentoringViewController = CreateMentoringViewController()
                navigationController?.pushViewController(createMentoringViewController, animated: true)
            }
        )
    }
}


extension MentoringListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentoringManager.mentoringList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Texts.mentoringCellIdentifier, for: indexPath)
        let mentoring = mentoringManager.mentoringList[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration {
            MentoringCell(mentoring: mentoring)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMentoring = mentoringManager.mentoringList[indexPath.row]
        print("Selected Mentoring: \(selectedMentoring.title)")
    }
}
