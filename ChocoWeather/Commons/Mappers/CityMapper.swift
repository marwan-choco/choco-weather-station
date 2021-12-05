import Foundation
import UIKit

protocol CityMapperProtocol {
    func flag(for city: City) -> String
}

final class CityMapper: CityMapperProtocol{
    
    func flag(for city: City) -> String {
        switch city {
        case .berlin, .hamburg, .cologne, .munich:
            return "🇩🇪"
        case .vienna:
            return "🇦🇹"
        case .paris:
            return "🇫🇷"
        case .brussels:
            return "🇧🇪"
        case .newYourk, .chicago, .losAngeles, .seattle, .miami, .austin:
            return "🇺🇸"
        case .barcelona, .madrid:
            return "🇪🇸"
        }
    }
}
