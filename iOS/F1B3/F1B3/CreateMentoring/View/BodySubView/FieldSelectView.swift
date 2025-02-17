//
//  FieldSelectView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class FieldSelectView: BaseView {
    private lazy var content1View: UILabel = createLabel(
        fontSize: 20,
        weight: .bold,
        text: "지식을 나눠주셔서 감사합니다.",
        highlightText: "지식"
    )
    private lazy var content2View: UILabel = createLabel(
        fontSize: 15,
        weight: .bold,
        text: "멘토분들의 소중한 경험은 청년들에게 큰 힘이 됩니다."
    )
    private lazy var content3View: UILabel = createLabel(
        fontSize: 15,
        weight: .medium,
        text: "성공적인 멘토링 시작을 위해 몇 가지를 입력해주세요."
    )
    private lazy var content4View: UILabel = createLabel(
        fontSize: 24,
        weight: .bold,
        text: "멘토링 분야를 선택해주세요.",
        highlightText: "분야"
    )
    
    private let stackContainerView = UIStackView()
    private let selectableStackView = SelectableStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(content1View)
        addSubview(content2View)
        addSubview(content3View)
        addSubview(content4View)
        addSubview(selectableStackView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupContentViewsLayout()
        setupStackViewLayout()
    }
    
    private func setupContentViewsLayout() {
        content1View.translatesAutoresizingMaskIntoConstraints = false
        content2View.translatesAutoresizingMaskIntoConstraints = false
        content3View.translatesAutoresizingMaskIntoConstraints = false
        content4View.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            content1View.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            content1View.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            content2View.topAnchor.constraint(equalTo: content1View.bottomAnchor, constant: 10),
            content2View.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            content3View.topAnchor.constraint(equalTo: content2View.bottomAnchor, constant: 10),
            content3View.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            content4View.topAnchor.constraint(equalTo: content3View.bottomAnchor, constant: 16),
            content4View.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupStackViewLayout() {
        selectableStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectableStackView.topAnchor.constraint(equalTo: content4View.bottomAnchor, constant: 16),
            selectableStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectableStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createLabel(
        fontSize: CGFloat,
        weight: UIFont.Weight,
        text: String,
        highlightText: String? = nil
    ) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = .black
        label.numberOfLines = 0
        
        if let highlightText = highlightText {
            let attributedString = NSMutableAttributedString(string: text)
            let range = (text as NSString).range(of: highlightText)
            
            if range.location != NSNotFound {
                attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
            }
            
            label.attributedText = attributedString
        } else {
            label.text = text
        }
        
        return label
    }
}
