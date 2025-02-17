//
//  ContentInputView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/18/25.
//

import UIKit

final class ContentInputView: BaseView {
    private lazy var titleLabel = createLabel(text: "제목")
    private lazy var introductionLabel = createLabel(text: "자기소개")
    private lazy var subjectLabel = createLabel(text: "멘토링 주제")
    private lazy var methodLabel = createLabel(text: "멘토링 방식")
    private lazy var preparationLabel = createLabel(text: "멘토링 준비사항")
    
    private lazy var titleInputView = createTextView(placeholder: "어떤 멘토링인지 알려주세요")
    private lazy var introductionInputView = createTextView(placeholder: "멘티들을 위해 어떤 분인지 소개해주세요")
    private lazy var subjectInputView = createTextView(placeholder: "이런 내용으로 멘토링해요.\n - 이력서 첨삭\n - 면접 컨설팅\n - 커리어 고민 상담")
    private lazy var methodInputView = createTextView(placeholder: "이런 방식으로 진행해요.\n - 주 1회 온라인 미팅\n - 월 1회 오프라인 미팅")
    private lazy var preparationInputView = createTextView(placeholder: "멘티는 이런걸 준비해주세요.\n - 이력서\n - 질문 내용")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(titleLabel)
        addSubview(titleInputView)
        addSubview(introductionLabel)
        addSubview(introductionInputView)
        addSubview(subjectLabel)
        addSubview(subjectInputView)
        addSubview(methodLabel)
        addSubview(methodInputView)
        addSubview(preparationLabel)
        addSubview(preparationInputView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        titleViewLayout()
        introductionViewLayout()
        subjectViewLayout()
        methodViewLayout()
        preparationViewLayout()
    }
    
    private func titleViewLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            titleInputView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            titleInputView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func introductionViewLayout(){
        introductionLabel.translatesAutoresizingMaskIntoConstraints = false
        introductionInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            introductionLabel.topAnchor.constraint(equalTo: titleInputView.bottomAnchor, constant: 20),
            introductionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            introductionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            introductionInputView.topAnchor.constraint(equalTo: introductionLabel.bottomAnchor, constant: 8),
            introductionInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            introductionInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            introductionInputView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func subjectViewLayout(){
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        subjectInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subjectLabel.topAnchor.constraint(equalTo: introductionInputView.bottomAnchor, constant: 20),
            subjectLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            subjectLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            subjectInputView.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: 8),
            subjectInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            subjectInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            subjectInputView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    private func methodViewLayout(){
        methodLabel.translatesAutoresizingMaskIntoConstraints = false
        methodInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            methodLabel.topAnchor.constraint(equalTo: subjectInputView.bottomAnchor, constant: 20),
            methodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            methodLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            methodInputView.topAnchor.constraint(equalTo: methodLabel.bottomAnchor, constant: 8),
            methodInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            methodInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            methodInputView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func preparationViewLayout(){
        preparationLabel.translatesAutoresizingMaskIntoConstraints = false
        preparationInputView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            preparationLabel.topAnchor.constraint(equalTo: methodInputView.bottomAnchor, constant: 20),
            preparationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            preparationLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            preparationInputView.topAnchor.constraint(equalTo: preparationLabel.bottomAnchor, constant: 8),
            preparationInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            preparationInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            preparationInputView.heightAnchor.constraint(equalToConstant: 60),
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
    
    private func createTextView(placeholder: String? = nil) -> PlaceholderTextView {
        let textView = PlaceholderTextView()
        textView.placeholder = placeholder
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 5
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return textView
    }
}

