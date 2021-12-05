import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    let weatherStatusMapper: WeatherMapperProtocol
    let regionMapper: RegionMapperProtocol
    let city: City
    
    init(
        city: City,
        weatherStatusMapper: WeatherMapperProtocol,
        regionMapper: RegionMapperProtocol
    ) {
        self.city = city
        self.weatherStatusMapper = weatherStatusMapper
        self.regionMapper = regionMapper
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
    
    func getViewModel(with weather: Weather, in city: City) -> DetailViewModel {
        let region = regionMapper.map(city: city)
        let statusImage = weatherStatusMapper.map(status: weather.status)
        let regionImage = regionMapper.image(for: region)
        switch region {
        case .r1:
            return .init(
                cityName: city.description,
                topImage: statusImage,
                temperature: weather.temperature,
                windSpeed: weather.windSpeed,
                regionName: region.description,
                bottomImage: regionImage
            )
        case .r2:
            return .init(
                cityName: city.description,
                topImage: statusImage,
                temperature: weather.temperature,
                windSpeed: weather.windSpeed,
                regionName: region.description,
                bottomImage: nil
            )
        case .r3:
            return .init(
                cityName: city.description,
                topImage: nil,
                temperature: weather.temperature,
                windSpeed: weather.windSpeed,
                regionName: region.description,
                bottomImage: statusImage
            )
        case .r4:
            return .init(
                cityName: city.description,
                topImage: regionImage,
                temperature: weather.temperature,
                windSpeed: weather.windSpeed,
                regionName: region.description,
                bottomImage: statusImage
            )
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func loadOnError() {
        view?.showError()
    }
    
    func loadFinished(_ result: Weather) {
        let model = getViewModel(with: result, in: city)
        view?.updateData(with: model)
    }
}
