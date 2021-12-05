import Foundation
import UIKit

struct DetailViewModel {
    var cityName: String
    var topImage: UIImage?
    var temperature: String
    var windSpeed: String
    var regionName: String
    var bottomImage: UIImage?
    
    init(
        cityName: String,
        topImage: UIImage?,
        temperature: String,
        windSpeed: String,
        regionName: String,
        bottomImage: UIImage?
    ) {
        self.cityName = cityName
        self.topImage = topImage
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.regionName = regionName
        self.bottomImage = bottomImage
    }
}
