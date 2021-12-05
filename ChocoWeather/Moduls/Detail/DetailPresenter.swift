import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    let strategy: DetailStrategy
    let city: City
    
    init(
        city: City,
        strategy: DetailStrategy
    ) {
        self.city = city
        self.strategy = strategy
    }
    
    func viewDidLoad() {
        showDetails(for: city)
        interactor?.fetchDatas(city: city)
    }
    
    func showDetails(for item: City) {
        view?.setTitle(item.description)
    }
}

extension DetailPresenter {
    
    func createViewModel(with weather: Weather, in city: City) -> DetailViewModel {
        strategy.getViewModel(with: weather, in: city)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func loadOnError() {
        view?.showError()
    }
    
    func loadFinished(_ result: Weather) {
        let model = createViewModel(with: result, in: city)
        view?.updateData(with: model)
    }
}
