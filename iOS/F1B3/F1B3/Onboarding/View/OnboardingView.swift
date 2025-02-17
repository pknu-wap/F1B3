//
//  OnboardingView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class OnboardingView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SeMentor"
        label.textColor = .app
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let text = "소중한 경험을 나눠주세요"
        let highlightText = "경험"
        
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: highlightText)
        
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        }
        
        label.attributedText = attributedString
        return label
    }()
    
    private let characterImage = UIImageView(image: UIImage(named: "Character"))
    
    private let createButton = MentoringCreateButton()
    private let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("멘토 둘러보기 →", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(characterImage)
        addSubview(createButton)
        addSubview(listButton)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        labelViewLayout()
        imageViewLayout()
        buttonViewLayout()
    }
    
    private func labelViewLayout(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentLabel.topAnchor, constant: -20),
            
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: characterImage.topAnchor, constant: -10)
        ])
    }
    
    private func imageViewLayout(){
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 240),
            characterImage.heightAnchor.constraint(equalToConstant: 244)
        ])
    }
    
    private func buttonViewLayout(){
        createButton.translatesAutoresizingMaskIntoConstraints = false
        listButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 180),
            createButton.heightAnchor.constraint(equalToConstant: 50),
            createButton.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
            
            listButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            listButton.topAnchor.constraint(equalTo: createButton.bottomAnchor)
        ])
    }
    
    func addCreateButtonAction(_ action: UIAction) {
        createButton.addAction(action, for: .touchUpInside)
    }
    
    func addListButtonAction(_ action: UIAction) {
        listButton.addAction(action, for: .touchUpInside)
    }
}
