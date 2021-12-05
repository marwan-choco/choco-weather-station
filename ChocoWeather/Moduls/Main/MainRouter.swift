import UIKit

class MainRouter: MainRouterProtocol {
    let view: MainViewProtocol
    let detailFactory: DetailFactroyProtocol
    
    init(view: MainViewProtocol, detailFactory: DetailFactroyProtocol) {
        self.view = view
        self.detailFactory = detailFactory
    }
    
    func presentPostDetailScreen(for data: City) {
        let viewController = detailFactory.make(city: data)
        if let sourceView = self.view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
