import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Factroies
    lazy var mainFactory: MainFactroy = {
        let regionMapper = RegionMapper()
        let cityMapper = CityMapper()
        let weatherMapper = WeatherMapper()
        let detailFactroy = DetailFactroy(
            weatherMapper: weatherMapper,
            regionMapper: regionMapper
        )
        return MainFactroy(
            regionMapper: regionMapper,
            cityMapper: cityMapper,
            detailFactory: detailFactroy
        )
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainFactory.makeWithNavigation()
        self.window?.makeKeyAndVisible()
        return true
    }
}

