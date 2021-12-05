import Foundation
import UIKit

protocol SectionBuilderProtocol {
    func setTitle(_ title: String)
    func addItem(_ item: MainViewModel)
    func removeItem(_ item: MainViewModel)
    func build() -> SectionViewModel
}

final class SectionBuilder {
    private(set) var title: String
    private(set) var items: [MainViewModel] = []
    
    init(title: String) {
        self.title = title
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func addItem(_ item: MainViewModel) {
        items.append(item)
    }
    
    func removeItem(_ item: MainViewModel) {
        items = items.filter { $0.title == item.title }
    }
    
    func build() -> SectionViewModel {
        .init(title: title, items: items)
    }
}
