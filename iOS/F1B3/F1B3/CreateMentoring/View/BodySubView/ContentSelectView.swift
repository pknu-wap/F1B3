//
//  ContentSelectView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class ContentSelectView: BaseView {
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let text = "멘토링 내용을 입력해 주세요."
        let highlightText = "내용"
        
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: highlightText)
        
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        }
        
        label.attributedText = attributedString
        return label
    }()
    
    private let contentInputView = ContentInputView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(contentLabel)
        addSubview(contentInputView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        contentLabelLayout()
        contentInputViewLayout()
    }
    
    private func contentLabelLayout() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func contentInputViewLayout() {
        contentInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentInputView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor),
            contentInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentInputView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
