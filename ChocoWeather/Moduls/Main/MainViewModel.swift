import Foundation
import UIKit

struct SectionViewModel {
    let title: String
    var items: [MainViewModel]
    
    init(
        title: String,
        items: [MainViewModel] = []
    ) {
        self.title = title
        self.items = items
    }
}

struct MainViewModel {
    let title: String
    let subtitle: String?
    let image: UIImage?
    let city: City
    
    init(for city: City,
        title: String,
        subtitle: String?,
        image: UIImage?
    ) {
        self.city = city
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
