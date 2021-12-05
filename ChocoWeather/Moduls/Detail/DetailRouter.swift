import UIKit

class DetailRouter: DetailRouterProtocol {
    
    func dismiss(from view: DetailViewProtocol) {
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.popViewController(animated: true)
        }
    }
}
