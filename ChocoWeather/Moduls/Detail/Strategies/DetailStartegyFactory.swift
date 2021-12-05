import Foundation

protocol DetailStartegyFactoryProtocol {
    func make(region: Region) -> DetailStrategy
}

final class DetailStartegyFactory: DetailStartegyFactoryProtocol {
    private let weatherStatusMapper: WeatherMapperProtocol
    private let regionMapper: RegionMapperProtocol
    
    init(
        weatherStatusMapper: WeatherMapperProtocol,
        regionMapper: RegionMapperProtocol
    ) {
        self.weatherStatusMapper = weatherStatusMapper
        self.regionMapper = regionMapper
    }
    
    func make(region: Region) -> DetailStrategy {
        switch region {
        case .r1:
            return R1DetailStrategy(weatherStatusMapper: weatherStatusMapper, regionMapper: regionMapper)
        case .r2:
            return R2DetailStrategy(weatherStatusMapper: weatherStatusMapper, regionMapper: regionMapper)
        case .r3:
            return R3DetailStrategy(weatherStatusMapper: weatherStatusMapper, regionMapper: regionMapper)
        case .r4:
            return R4DetailStrategy(weatherStatusMapper: weatherStatusMapper, regionMapper: regionMapper)
        }
    }
}
