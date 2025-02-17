//
//  CreateMentoringFooterView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class CreateMentoringFooterView: BaseView {
    let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .app
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(previousButton)
        addSubview(nextButton)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupPreviousButtonLayout()
        setupNextButtonLayout()
    }
    
    private func setupPreviousButtonLayout() {
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            previousButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            previousButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            previousButton.heightAnchor.constraint(equalToConstant: 50),
            previousButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor),
        ])
    }
    
    private func setupNextButtonLayout() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 10),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: previousButton.bottomAnchor),
            nextButton.heightAnchor.constraint(equalTo: previousButton.heightAnchor)
        ])
    }
    
    func previousButtonAction(_ action: UIAction) {
        previousButton.addAction(action, for: .touchUpInside)
    }
    
    func nextButtonAction(_ action: UIAction) {
        nextButton.addAction(action, for: .touchUpInside)
    }
    
    func updateNextButtonTitle(isLastStep: Bool) {
        let title = isLastStep ? "완료" : "다음"
        nextButton.setTitle(title, for: .normal)
    }
    
    func updatePreviousButtonState(isEnabled: Bool) {
        previousButton.isEnabled = isEnabled
        previousButton.alpha = isEnabled ? 1.0 : 0.5 // ✅ 비활성화 시 투명도를 낮춤
    }
}
