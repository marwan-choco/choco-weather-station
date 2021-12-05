import UIKit

class MainRouter: MainRouterProtocol {
    let view: MainViewProtocol
    
    init(view: MainViewProtocol) {
        self.view = view
    }
    
    func presentPostDetailScreen(for data: City) {
        
        var viewController = UIViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = view as? DetailView {
            let weatherStatusMapper = WeatherMapper()
            let regionMapper: RegionMapperProtocol = RegionMapper()
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter(
                city: data,
                weatherStatusMapper: weatherStatusMapper,
                regionMapper: regionMapper
            )
            let repository: RepositoryProtocol = Repository()
            let interactor: DetailInteractorInputProtocol = DetailInteractor(repository: repository)
            let router: DetailRouterProtocol = DetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            viewController = view
        }
        
        if let sourceView = self.view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
