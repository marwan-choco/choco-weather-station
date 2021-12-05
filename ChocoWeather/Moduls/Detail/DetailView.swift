import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var bottomImage: UIImageView!

    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showError() {
        let controller = UIAlertController(title: "ERROR", message: "ERROR", preferredStyle: .alert)
        self.present(controller, animated: true, completion: nil)
    }
    
    func updateData(with model: DetailViewModel) {
        setTitle(model.cityName)
        topImage.image = model.topImage
        temperatureLabel.text = model.temperature
        windSpeedLabel.text = model.windSpeed
        regionLabel.text = model.regionName
        bottomImage.image = model.bottomImage
    }
}
