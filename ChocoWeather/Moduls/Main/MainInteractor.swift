import UIKit

class MainInteractor: MainInteractorInputProtocol {
    var presenter: MainInteractorOutputProtocol?
    
    func fetchDatas() {
        // Load Data
        presenter?.loadFinished(with: City.allCases.shuffled())
    }
}
