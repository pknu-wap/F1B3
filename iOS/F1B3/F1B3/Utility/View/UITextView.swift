//
//  UITextView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class PlaceholderTextView: UITextView, UITextViewDelegate {
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPlaceholder()
    }
    
    private func setupPlaceholder() {
        delegate = self
        
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
