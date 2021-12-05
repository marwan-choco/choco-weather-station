import Foundation

final class R3DetailStrategy: DetailStrategy {
    private let weatherStatusMapper: WeatherMapperProtocol
    private let regionMapper: RegionMapperProtocol
    
    init(
        weatherStatusMapper: WeatherMapperProtocol,
        regionMapper: RegionMapperProtocol
    ) {
        self.weatherStatusMapper = weatherStatusMapper
        self.regionMapper = regionMapper
    }
    
    func getViewModel(with weather: Weather, in city: City) -> DetailViewModel {
        let region = regionMapper.map(city: city)
        return .init(
            cityName: city.description,
            topImage: nil,
            temperature: weather.temperature,
            windSpeed: weather.windSpeed,
            regionName: region.description,
            bottomImage: weatherStatusMapper.map(status: weather.status)
        )
    }
}
