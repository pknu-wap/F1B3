//
//  FieldSelectStackView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class SelectableStackView: UIStackView {
    
    private let categories = [
        "IT / 개발", "금융", "경영", "마케팅 / 브랜딩",
        "영업 / 고객관리", "인사 / 조직관리", "제조 / 생산", "교육 / 컨설팅"
    ]
    
    private var buttons: [UIButton] = []
    
    private var selectedIndex: Int? {
        didSet {
            updateButtonStyles()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        setupButtons()
    }
    
    private func setupStackView() {
        axis = .vertical
        alignment = .center
        distribution = .equalSpacing
        spacing = 8
    }
    
    private func setupButtons() {
        for (index, category) in categories.enumerated() {
            let button = createButton(title: category, tag: index)
            buttons.append(button)
            addArrangedSubview(button)
        }
    }
    
    private func createButton(title: String, tag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.frame.size = CGSize(width: 350, height: 40)
        button.widthAnchor.constraint(equalToConstant: 330).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.tag = tag
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
    }
    
    private func updateButtonStyles() {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.backgroundColor = UIColor.systemBlue
                button.layer.borderColor = UIColor.systemBlue.cgColor
                button.setTitleColor(.white, for: .normal)
            } else {
                button.backgroundColor = .white
                button.layer.borderColor = UIColor.gray.cgColor
                button.setTitleColor(.black, for: .normal)
            }
        }
    }
}
