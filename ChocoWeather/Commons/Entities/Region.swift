import Foundation

enum Region: CaseIterable, CustomStringConvertible {
    case r1, r2, r3, r4
    
    var description: String {
        switch self {
        case .r1:
             return "One"
        case .r2:
            return "Two"
        case .r3:
            return "Three"
        case .r4:
            return "Four"
        }
    }
}
