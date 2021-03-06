import Foundation
import UIKit

protocol CityMapperProtocol {
    func flag(for city: City) -> String
}

final class CityMapper: CityMapperProtocol{
    
    func flag(for city: City) -> String {
        switch city {
        case .berlin, .hamburg, .cologne, .munich:
            return "π©πͺ"
        case .vienna:
            return "π¦πΉ"
        case .paris:
            return "π«π·"
        case .brussels:
            return "π§πͺ"
        case .newYourk, .chicago, .losAngeles, .seattle, .miami, .austin:
            return "πΊπΈ"
        case .barcelona, .madrid:
            return "πͺπΈ"
        }
    }
}
