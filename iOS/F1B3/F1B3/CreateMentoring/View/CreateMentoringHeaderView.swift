//
//  CreateMentoringHeaderView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class CreateMentoringHeaderView: BaseView {
    
    private let stackView = UIStackView()
    private var stepLines: [UIView] = []
    private var stepLabels: [UILabel] = []
    
    private let steps = ["분야", "경력", "멘토링 내용", "완료"]
    
    var currentStep: Int = 0 {
        didSet {
            updateStepUI()
        }
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        setupStackView()
        setupSteps()
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        setupStackViewLayout()
        setupStepLayouts()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    private func setupSteps() {
        for step in steps {
            let lineView = UIView()
            lineView.backgroundColor = .gray
            lineView.translatesAutoresizingMaskIntoConstraints = false
            lineView.layer.cornerRadius = 3
            stepLines.append(lineView)
            
            let label = UILabel()
            label.text = step
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.textAlignment = .center
            stepLabels.append(label)
            
            let stepContainer = UIStackView(arrangedSubviews: [lineView, label])
            stepContainer.axis = .vertical
            stepContainer.alignment = .center
            stepContainer.spacing = 8
            
            stackView.addArrangedSubview(stepContainer)
        }
    }
    
    private func setupStackViewLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func setupStepLayouts() {
        for line in stepLines {
            NSLayoutConstraint.activate([
                line.heightAnchor.constraint(equalToConstant: 6),
                line.widthAnchor.constraint(equalToConstant: 70)
            ])
        }
    }
    
    private func updateStepUI() {
        for (index, line) in stepLines.enumerated() {
            let label = stepLabels[index]
            
            if index < currentStep {
                line.backgroundColor = UIColor.sky
                label.textColor = UIColor.sky
            } else if index == currentStep {
                line.backgroundColor = UIColor.app
                label.textColor = UIColor.app
            } else {
                line.backgroundColor = UIColor.gray
                label.textColor = UIColor.gray
            }
        }
    }
}
