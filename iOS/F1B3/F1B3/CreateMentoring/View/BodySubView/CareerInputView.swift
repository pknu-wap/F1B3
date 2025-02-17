//
//  CareerInputView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class CareerInputView: BaseView {
    private lazy var companyNameLabel = createLabel(text: "회사명")
    private lazy var yearLabel = createLabel(text: "재직 기간")
    private lazy var yearContentLabel = createLabel(text: "년")
    private lazy var contentLabel = createLabel(text: "직무 내용")
    
    private lazy var companyInputView = createTextField(placeholder: "OO회사")
    private lazy var yearInputView = createTextField(placeholder: "OO")
    private lazy var contentInputView = createTextField()
    private let splitView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor.gray
        return uiView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(companyNameLabel)
        addSubview(companyInputView)
        addSubview(yearLabel)
        addSubview(yearContentLabel)
        addSubview(yearInputView)
        addSubview(contentLabel)
        addSubview(contentInputView)
        addSubview(splitView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        companyViewLayout()
        yearViewLayout()
        contentViewLayout()
        splitViewLayout()
    }
    
    private func companyViewLayout() {
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            companyNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            companyInputView.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 8),
            companyInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            companyInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            companyInputView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func yearViewLayout(){
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearContentLabel.translatesAutoresizingMaskIntoConstraints = false
        yearInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: companyInputView.bottomAnchor, constant: 20),
            yearLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            yearLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            yearInputView.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 8),
            yearInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            yearInputView.widthAnchor.constraint(equalToConstant: 320),
            yearInputView.heightAnchor.constraint(equalToConstant: 40),
            
            yearContentLabel.topAnchor.constraint(equalTo: yearInputView.topAnchor),
            yearContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            yearContentLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func contentViewLayout(){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: yearContentLabel.bottomAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            contentInputView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 8),
            contentInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            contentInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            contentInputView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func splitViewLayout(){
        splitView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splitView.topAnchor.constraint(equalTo: contentInputView.bottomAnchor, constant: 20),
            splitView.centerXAnchor.constraint(equalTo: centerXAnchor),
            splitView.widthAnchor.constraint(equalToConstant: 350), // 길이 조절
            splitView.heightAnchor.constraint(equalToConstant: 0.5)   // 얇은 실선
            
        ])
    }
    
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = text
        label.textColor = .black
        label.textAlignment = .left
        return label
    }
    
    private func createTextField(placeholder: String? = nil) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        return textField
    }
}
