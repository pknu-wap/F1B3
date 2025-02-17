//
//  CreateMentoringViewController.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class CreateMentoringViewController: BaseViewController {
    
    private let createMentoringView: CreateMentoringView
    private let mentoringDTO: MentoringDTO
    private var currentPage: Int {
        didSet {
            updateUIForCurrentPage()
            createMentoringView.createMentoringHeaderView.currentStep = currentPage
        }
    }
    
    init() {
        self.createMentoringView = CreateMentoringView()
        self.mentoringDTO = MentoringDTO()
        self.currentPage = 0
        createMentoringView.createMentoringHeaderView.currentStep = currentPage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = createMentoringView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtonDidTapAction()
        previousButtonDidTapAction()    
    }
    
    override func setupNavigationBar() {
        title = "멘토링 등록"
        
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
    }
    
    private func previousButtonDidTapAction() {
        createMentoringView.createMentoringFooterView.previousButtonAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                if self.currentPage <= 0 {
                    showAlert(message: "첫 번째 단계입니다.")
                    return
                }
                self.currentPage -= 1
            }
        )
    }
    
    private func nextButtonDidTapAction() {
        createMentoringView.createMentoringFooterView.nextButtonAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                if self.currentPage == 3 {
                    // TODO: - CREATE 요청 보내기
                    let mentoringListViewController = MentoringListViewController(mentoringManager: MentoringManager())
                    navigationController?.pushViewController(mentoringListViewController, animated: true)
                    return
                }
                
                self.currentPage += 1
            }
        )
    }
    
    private func updateUIForCurrentPage() {
        createMentoringView.setupBodyView(currentPage: currentPage)
        
        let isLastStep = currentPage == 3
        createMentoringView.createMentoringFooterView.updateNextButtonTitle(isLastStep: isLastStep)
        
        createMentoringView.createMentoringFooterView.updatePreviousButtonState(isEnabled: currentPage != 0)

    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
