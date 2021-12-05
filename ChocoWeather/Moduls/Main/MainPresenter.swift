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
        var sections: [SectionViewModel] = []
        for region in Region.allCases {
            let builder = SectionBuilder(title: region.description)
            for city in datas where regionMapper.map(city: city) == region {
                let subtitle = cityMapper.flag(for: city)
                let image = regionMapper.image(for: region)
                let model = MainViewModel(for: city, title: city.description, subtitle: subtitle, image: image)
                builder.addItem(model)
            }
            sections.append(builder.build())
            
        }
        view?.showDatas(with: sections)
    }
}
