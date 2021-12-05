import Foundation
import UIKit

struct Weather {
    var city: String
    var status: String
    var temperature: String
    var windSpeed: String
    
    init(
        city: String,
        status: String,
        temperature: String,
        windSpeed: String
    ) {
        
        self.city = city
        self.status = status
        self.temperature = temperature
        self.windSpeed = windSpeed
    }
}
