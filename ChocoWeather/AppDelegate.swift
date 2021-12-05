import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "MainView")
        if let view = view as? MainView {
            let regionMapper: RegionMapperProtocol = RegionMapper()
            let cityMapper: CityMapperProtocol = CityMapper()
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter(cityMapper: cityMapper, regionMapper: regionMapper)
            let interactor: MainInteractorInputProtocol = MainInteractor()
            let router: MainRouterProtocol = MainRouter(view: view)
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
        }
        let controller = UINavigationController(rootViewController: view)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

