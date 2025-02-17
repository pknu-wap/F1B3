import UIKit

class BaseView: UIView {
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
        setupSubviews()
        setupSubviewLayouts()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupStyles()
        setupSubviews()
        setupSubviewLayouts()
        setupActions()
    }
    
    // MARK: RetsTalk lifecycle
    
    func setupStyles() {
        backgroundColor = .white
        
    }
    
    func setupSubviews() {}
    
    func setupSubviewLayouts() {}
    
    func setupActions() {}
}
