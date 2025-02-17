//
//  FinishView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class FinishView: BaseView {
    private lazy var content1View: UILabel = createLabel(
        fontSize: 24,
        weight: .bold,
        text: "멘토링이 등록되었습니다!"
    )
    private lazy var content2View: UILabel = createLabel(
        fontSize: 20,
        weight: .medium,
        text: "멘티의 멘토링 신청은 이메일로 발송됩니다.",
        highlightText: "이메일"
    )
    
    
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
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupContentViewsLayout()
    }
    
    private func setupContentViewsLayout() {
        content1View.translatesAutoresizingMaskIntoConstraints = false
        content2View.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            content1View.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            content1View.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            content2View.topAnchor.constraint(equalTo: content1View.bottomAnchor, constant: 20),
            content2View.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
