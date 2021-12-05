import Foundation
import UIKit

final class MainFactroy: MainFactroyProtocol {
    let regionMapper: RegionMapperProtocol
    let cityMapper: CityMapperProtocol
    let detailFactory: DetailFactroyProtocol
    
    init(
        regionMapper: RegionMapperProtocol,
        cityMapper: CityMapperProtocol,
        detailFactory: DetailFactroyProtocol
    ) {
        self.regionMapper = regionMapper
        self.cityMapper = cityMapper
        self.detailFactory = detailFactory
    }
    
    func makeWithNavigation() -> UINavigationController {
        let view = make()
        return UINavigationController(rootViewController: view)
    }
    
    func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "MainView")
        if let view = view as? MainView {
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter(cityMapper: cityMapper, regionMapper: regionMapper)
            let interactor: MainInteractorInputProtocol = MainInteractor()
            let router: MainRouterProtocol = MainRouter(view: view, detailFactory: detailFactory)
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
        }
        return view
    }
}
