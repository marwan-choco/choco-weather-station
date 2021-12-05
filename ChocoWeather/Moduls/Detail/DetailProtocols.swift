import UIKit

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showDetails(for item: City)
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func loadFinished(_ result: Weather)
    func loadOnError()
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func fetchDatas(city: City)
}

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func setTitle(_ title: String)
    func updateData(with model: DetailViewModel)
    func showError()
}

protocol DetailRouterProtocol {
    // PRESENTER -> Router
    func dismiss(from view: DetailViewProtocol)
}

protocol DetailFactroyProtocol {
    func make(city: City) -> UIViewController
}
