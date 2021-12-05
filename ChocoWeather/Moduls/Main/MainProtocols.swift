import UIKit

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
    func showDetails(for item: City)
}

protocol MainInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func loadFinished(with datas: [City])
    func loadOnError()
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func fetchDatas()
}

protocol MainViewProtocol {
    var presenter: MainPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func setTitle(_ title: String) 
    func showDatas(with models: [SectionViewModel])
}

protocol MainRouterProtocol {
    // PRESENTER -> Router
    func presentPostDetailScreen(for data: City)
}


