import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    let repository: RepositoryProtocol
    var presenter: DetailInteractorOutputProtocol?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchDatas(city: City) {
        repository.fetchDatas(in: city) { [weak self] result in
            switch result {
            case .success(let value):
                self?.presenter?.loadFinished(value)
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.loadOnError()
            }
        }
    }
}
