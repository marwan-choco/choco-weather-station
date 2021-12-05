import Foundation
import UIKit

enum City: String, CaseIterable, CustomStringConvertible {
    case berlin
    case hamburg
    case cologne
    case munich
    case vienna
    case paris
    case brussels
    case newYourk = "new-york"
    case chicago
    case losAngeles = "los-angeles"
    case seattle
    case miami
    case austin
    case barcelona
    case madrid
    
    var description: String {
        return rawValue.replacingOccurrences(of: "-", with: " ").capitalized
    }
}
