import UIKit

class BaseNavigationController: UINavigationController {
    
    init(rootView: BaseViewController) {
        super.init(rootViewController: rootView)
        
        setupNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - RetsTalk lifecycle

    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.backgroundColor = .systemBackground
    }
}
