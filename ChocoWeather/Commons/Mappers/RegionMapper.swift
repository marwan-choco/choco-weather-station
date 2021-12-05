import Foundation
import UIKit

protocol RegionMapperProtocol {
    func map(city: City) -> Region
    func image(for region: Region) -> UIImage?
}

final class  RegionMapper: RegionMapperProtocol{
    func map(city: City) -> Region {
        switch city {
        case .berlin, .hamburg, .cologne, .munich, .vienna:
            return .r1
        case .paris, .brussels:
            return .r2
        case .newYourk, .chicago, .losAngeles, .seattle, .miami, .austin:
            return .r3
        case .barcelona, .madrid:
            return .r4
        }
    }
    
    func image(for region: Region) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration.preferringMulticolor()
        switch region {
        case .r1:
            return UIImage(systemName: "suit.heart.fill", withConfiguration: configuration)
        case .r2:
            return UIImage(systemName: "suit.club.fill", withConfiguration: configuration)
        case .r3:
            return UIImage(systemName: "suit.diamond.fill", withConfiguration: configuration)
        case .r4:
            return UIImage(systemName: "suit.spade.fill", withConfiguration: configuration)
        }
    }
}
