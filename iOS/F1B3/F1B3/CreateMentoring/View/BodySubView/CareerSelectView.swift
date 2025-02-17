//
//  CareerSelectView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class CareerSelectView: BaseView {
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let text = "경력을 입력해 주세요."
        let highlightText = "경력"
        
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: highlightText)
        
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        }
        
        label.attributedText = attributedString
        return label
    }()
    
    private let careerInputView = CareerInputView()
    
    private let addCareerButton: UIButton = {
        let button = UIButton()
        button.setTitle("경력 추가하기 +", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(contentLabel)
        addSubview(careerInputView)
        addSubview(addCareerButton)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        contentLabelLayout()
        careerInputViewLayout()
        addCareerButtonLayout()
    }
    
    private func contentLabelLayout() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func careerInputViewLayout() {
        careerInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            careerInputView.topAnchor.constraint(equalTo: topAnchor),
            careerInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            careerInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            careerInputView.heightAnchor.constraint(greaterThanOrEqualToConstant: 400)
        ])
    }
    
    private func addCareerButtonLayout() {
        addCareerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            addCareerButton.topAnchor.constraint(equalTo: careerInputView.bottomAnchor, constant: 20),
            addCareerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addCareerButton.widthAnchor.constraint(equalToConstant: 350),
            addCareerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
