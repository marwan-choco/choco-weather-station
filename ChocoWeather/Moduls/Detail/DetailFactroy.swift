import Foundation
import UIKit

final class DetailFactroy: DetailFactroyProtocol {
    let weatherMapper: WeatherMapperProtocol
    let regionMapper: RegionMapperProtocol
    
    init(
        weatherMapper: WeatherMapperProtocol,
        regionMapper: RegionMapperProtocol
    ) {
        self.weatherMapper = weatherMapper
        self.regionMapper = regionMapper
    }
    
    func make(city: City) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = view as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter(
                city: city,
                weatherStatusMapper: weatherMapper,
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
        }
        return view
    }
}
