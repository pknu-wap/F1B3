//
//  MentoringCreateButton.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class MentoringCreateButton: UIButton {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pencil"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabelCustom: UILabel = {
        let label = UILabel()
        label.text = "멘토링 등록하기"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
        setupLayout()
    }
    
    private func setupStyle() {
        backgroundColor = UIColor.systemBlue
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        clipsToBounds = false
    }

    private func setupLayout() {
        addSubview(iconImageView)
        addSubview(titleLabelCustom)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelCustom.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),

            titleLabelCustom.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            titleLabelCustom.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabelCustom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
