//
//  CreateMentoringView.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

import UIKit

final class CreateMentoringView: BaseView {
    let createMentoringHeaderView = CreateMentoringHeaderView()
    let subViews: [UIView] = [
        FieldSelectView(),
        CareerSelectView(),
        ContentSelectView(),
        FinishView()
    ]
    private(set) var bodyView: UIView
    let createMentoringFooterView = CreateMentoringFooterView()
    
    override init(frame: CGRect) {
        self.bodyView = subViews.first!
        createMentoringFooterView.updatePreviousButtonState(isEnabled: false)
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(createMentoringHeaderView)
        addSubview(bodyView)
        addSubview(createMentoringFooterView)
    }
    
    override func setupSubviewLayouts() {
        super.setupSubviewLayouts()
        
        setupHeaderViewLayout()
        setupBodyViewLayout()
        setupFooterViewLayout()
    }
    
    private func setupHeaderViewLayout() {
        createMentoringHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createMentoringHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            createMentoringHeaderView.heightAnchor.constraint(equalToConstant: 70),
            createMentoringHeaderView.leftAnchor.constraint(equalTo: leftAnchor),
            createMentoringHeaderView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    private func setupBodyViewLayout() {
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: createMentoringHeaderView.bottomAnchor),
            bodyView.bottomAnchor.constraint(equalTo: createMentoringFooterView.topAnchor),
            bodyView.leftAnchor.constraint(equalTo: leftAnchor),
            bodyView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    private func setupFooterViewLayout() {
        createMentoringFooterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createMentoringFooterView.heightAnchor.constraint(equalToConstant: 90),
            createMentoringFooterView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            createMentoringFooterView.leftAnchor.constraint(equalTo: leftAnchor),
            createMentoringFooterView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    func setupBodyView(currentPage: Int){
        bodyView = subViews[currentPage]
    }
    
}
