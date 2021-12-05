import Foundation
import UIKit

protocol WeatherMapperProtocol {
    func map(status: String) -> UIImage?
}

final class WeatherMapper: WeatherMapperProtocol {
    func map(status: String) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration.preferringMulticolor()
        switch status {
        case "☀️":
            return UIImage(systemName: "sun.max.fill", withConfiguration: configuration)
        case "☁️":
            return UIImage(systemName: "cloud.fill", withConfiguration: configuration)
        case "⛅️", "🌥", "🌤":
            return UIImage(systemName: "cloud.sun.fill", withConfiguration: configuration)
        case "🌦":
            return UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: configuration)
        case "🌧":
            return UIImage(systemName: "cloud.sleet.fill", withConfiguration: configuration)
        case "⛈":
            return UIImage(systemName: "cloud.bolt.rain.fill", withConfiguration: configuration)
        case "❄️":
            return UIImage(systemName: "snowflake", withConfiguration: configuration)
        case "🌨":
            return UIImage(systemName: "cloud.snow.fill", withConfiguration: configuration)
        case "🌫":
            return UIImage(systemName: "smoke.fill", withConfiguration: configuration)
        default:
            return nil
        }
    }
}
