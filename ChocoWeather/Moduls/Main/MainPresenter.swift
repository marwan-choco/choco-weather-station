import UIKit

class MainPresenter: MainPresenterProtocol {
    var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    let cityMapper: CityMapperProtocol
    let regionMapper: RegionMapperProtocol
    
    init(cityMapper: CityMapperProtocol, regionMapper: RegionMapperProtocol) {
        self.cityMapper = cityMapper
        self.regionMapper = regionMapper
    }
    
    func viewDidLoad() {
        view?.setTitle("Regions")
        interactor?.fetchDatas()
    }
    
    func showDetails(for item: City) {
        router?.presentPostDetailScreen(for: item)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    func loadOnError() {
        // Error
    }
    
    func loadFinished(with datas: [City]) {
        var sections: [SectionViewModel] = Region.allCases.map { .init(title: $0.description) }
        for city in datas {
            let region = regionMapper.map(city: city)
            let subtitle = cityMapper.flag(for: city)
            let image = regionMapper.image(for: region)
            let model = MainViewModel(for: city, title: city.description, subtitle: subtitle, image: image)
            for item in sections.enumerated() where region.description == item.element.title {
                sections[item.offset].items.append(model)
            }
        }
        view?.showDatas(with: sections)
    }
}
