//
//  OnboardingViewController.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class OnboardingViewController: UIViewController {
    private let onboardingView: OnboardingView
    
    init() {
        self.onboardingView = OnboardingView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtonDidTapAction()
        listButtonDidTapAction()
    }
    
    private func createButtonDidTapAction() {
        onboardingView.addCreateButtonAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                
                let createMentoringViewController = CreateMentoringViewController()
                navigationController?.pushViewController(createMentoringViewController, animated: true)
            }
        )
    }
    
    private func listButtonDidTapAction() {
        onboardingView.addListButtonAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                
                let createMentoringViewController = MentoringListViewController(mentoringManager: MentoringManager())
                navigationController?.pushViewController(createMentoringViewController, animated: true)
            }
        )
    }
    
}
