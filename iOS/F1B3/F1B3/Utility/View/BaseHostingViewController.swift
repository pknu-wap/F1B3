import SwiftUI

class BaseHostingViewController<Content: View>: UIHostingController<Content> {

    // MARK: ViewController lifecyfcle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    // MARK: RetsTalk lifecycle

    func setupDelegation() {}

}
